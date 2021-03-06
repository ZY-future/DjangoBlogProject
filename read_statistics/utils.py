from datetime import datetime, timedelta

from django.contrib.contenttypes.models import ContentType
from read_statistics.models import ReadNum, ReadDetail
from django.utils import timezone
from django.db.models import Sum


def read_statistics_once_read(request, obj):
    ct = ContentType.objects.get_for_model(obj)
    key = "%s_%s_read" % (ct.model, obj.pk)
    if not request.COOKIES.get(key):
        # if ReadNum.objects.filter(content_type=ct, object_id=obj.pk).count():
        #     # 存在
        #     readnum = ReadNum.objects.get(content_type=ct, object_id=obj.pk)
        #     readnum.read_num += 1
        #     readnum.save()
        # else:
        #     readnum = ReadNum(content_type=ct, object_id=obj.pk)
        # 总的阅读数目
        readnum, created = ReadNum.objects.get_or_create(content_type=ct, object_id=obj.pk)
        readnum.read_num += 1
        readnum.save()
        date = timezone.now().date()
        # if ReadDetail.objects.filter(content_type=ct, object_id=obj.pk, date=date).count():
        #     readDetail = ReadDetail.objects.get(content_type=ct, object_id=obj.pk, date=date)
        # else:
        #     readDetail = ReadDetail(content_type=ct, object_id=obj.pk, date=date)
        # 当天阅读数目
        readDetail, created = ReadDetail.objects.get_or_create(content_type=ct, object_id=obj.pk, date=date)
        readDetail.read_num += 1
        readDetail.save()
    return key


# 获取七天数据
def get_seven_days_read_data(content_type):
    today = timezone.now().date()
    dates = []
    read_nums = []
    for i in range(7, 0, -1):
        date = today - timedelta(days=i)
        dates.append(date.strftime('%m/%d'))
        read_details = ReadDetail.objects.filter(content_type=content_type, date=date)
        result = read_details.aggregate(read_num_sum=Sum('read_num'))
        read_nums.append(result['read_num_sum'] or 0)
    return dates, read_nums

def get_toady_hot_data(content_type):
    today = timezone.now().date()
    read_details = ReadDetail.objects.filter(content_type=content_type,date=today).order_by('-read_num')
    return read_details[:7]

def get_yesterday_hot_data(content_type):
    today = timezone.now().date()
    yesterday = today-timedelta(days=1)
    read_details = ReadDetail.objects.filter(content_type=content_type,date=yesterday).order_by('-read_num')
    return read_details[:7]

def get_seven_hot_data(content_type):
    today = timezone.now().date()
    date = today - timedelta(days=7)
    read_details = ReadDetail.objects.filter(content_type=content_type, date__lte=today,date__gte=date)\
        .values('content_type','object_id')\
        .annotate(read_num_sum=Sum('read_num'))\
        .order_by('-read_num')
    return read_details[:7]
    
