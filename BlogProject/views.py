from django.contrib import auth
from django.shortcuts import render_to_response, redirect, render
import datetime
from django.utils import timezone
from django.contrib.contenttypes.models import ContentType
from read_statistics.utils import get_seven_days_read_data, get_toady_hot_data, get_yesterday_hot_data, \
    get_seven_hot_data
from blog.models import Blog
from django.db.models import Sum
from django.core.cache import cache
from django.urls import reverse
from .forms import LoginForm, RegForm
from django.contrib.auth.models import User

def get_7_day_hot_blogs():
    today = timezone.now().date()
    date = today - datetime.timedelta(days=7)
    blogs = Blog.objects.filter(read_details__date__lt=today, read_details__date__gt=date) \
        .values('id', 'title') \
        .annotate(read_num_sum=Sum('read_details__read_num')) \
        .order_by('-read_num_sum')
    return blogs[:7]


def home(request):
    blog_content_type = ContentType.objects.get_for_model(Blog)
    dates, read_nums = get_seven_days_read_data(blog_content_type)
    # 获取7天热门博客缓存数据
    hot_blogs_for_7_days = cache.get('hot_blogs_for_7_days')
    if hot_blogs_for_7_days is None:
        hot_blogs_for_7_days = get_7_day_hot_blogs()
        cache.set('hot_blogs_for_7_days', hot_blogs_for_7_days, 3600)
        print('计算')
    else:
        print("use cache")
    today_hot_data = get_toady_hot_data(blog_content_type)
    yesterday_hot_data = get_yesterday_hot_data(blog_content_type)
    # seven_hot_data = get_seven_hot_data(blog_content_type)
    seven_hot_data = get_7_day_hot_blogs()
    context = {}

    context['read_nums'] = read_nums
    context['dates'] = dates
    context['today_hot_data'] = today_hot_data
    context['yesterday_hot_data'] = yesterday_hot_data
    # context['seven_hot_data'] = seven_hot_data
    context['seven_hot_data'] = seven_hot_data
    return render(request, 'home.html', context)


def login(request):
    # username = request.POST.get('username', '')
    # password = request.POST.get('password', '')
    # user = auth.authenticate(request, username=username, password=password)
    # referer = request.META.get('HTTP_REFERER', reverse('home'))
    # if user is not None:
    #     auth.login(request, user)
    #     # 重定向
    #     return redirect(referer)
    # else:
    #     return render(request, 'error.html', {'message': '请检查用户名及密码'})
    if request.method == 'POST':
        loginform = LoginForm(request.POST)
        if loginform.is_valid():
            user = loginform.cleaned_data['user']
            auth.login(request, user)
            # 重定向
            return redirect(request.GET.get('from', reverse('home')))
    else:
        loginform = LoginForm()
    context = {}
    context['login_form'] = loginform
    return render(request, 'login.html', context)


def register(request):
    if request.method =='POST':
        regform = RegForm(request.POST)
        if regform.is_valid():
            username = regform.cleaned_data['username']
            password = regform.cleaned_data['password']
            email = regform.cleaned_data['email']
            print(username)
            #用户创建
            user = User.objects.create_user(username=username,email=email,password=password)
            user.save()
            #登录
            user = auth.authenticate(username=username, password=password)
            auth.login(request,user)
            return redirect(request.GET.get('from',reverse('home')))
    else:
        regform = RegForm()
    context = {}
    context['reg_form'] = regform
    return render(request, 'register.html', context)

