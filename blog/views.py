from django.shortcuts import render_to_response, get_object_or_404, render
from . import models
from django.core.paginator import Paginator
from django.conf import settings
from django.db.models import Count
from django.contrib.contenttypes.models import ContentType
from read_statistics.models import ReadNum
from read_statistics.utils import read_statistics_once_read
from django.contrib.contenttypes.models import ContentType
from comment.models import Comment
from comment.forms import CommentForm


# Create your views here.

def get_blog_list_common_data(request, blogs_all_list):
    # blogs_all_list = models.Blog.objects.filter(create_time__year=year, create_time__month=month)
    paginator = Paginator(blogs_all_list, settings.EACH_PAGE_BLOGS_NUMBER)
    page_num = request.GET.get("page", 1)  # 获取页码参数
    page_of_blogs = paginator.get_page(page_num)  # 是否有效页码
    current_page_num = page_of_blogs.number  # 获取当前页码
    page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + list(
        range(current_page_num, min(current_page_num + 2, paginator.num_pages) + 1))
    # 加上省略号
    if page_range[0] - 1 >= 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append('...')
    # 加上首尾页
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append((paginator.num_pages))

    # 获取对应博客的数量
    models.BlogType.objects.annotate(blog_count=Count('blog'))

    # blog_types = models.BlogType.objects.all()
    # blog_types_list = []
    # for blog_type in blog_types:
    #     blog_type.blog_count = models.Blog.objects.filter(blog_type=blog_type).count()
    #     blog_types_list.append(blog_type)
    # 获取发布日期博客数量
    blog_dates = models.Blog.objects.dates('create_time', 'month', order='DESC')
    blog_dates_dic = {}
    for blog_date in blog_dates:
        blog_count = models.Blog.objects.filter(create_time__year=blog_date.year,
                                                create_time__month=blog_date.month).count()
        blog_dates_dic[blog_date] = blog_count

    context = {}
    # context['blogs_with_date'] = '%s年%s月' % (year, month)
    # context['blog_types_list'] = blog_types_list
    context['blogs'] = page_of_blogs.object_list
    context['page_of_blogs'] = page_of_blogs
    context['page_range'] = page_range
    context['blog_types'] = models.BlogType.objects.annotate(blog_count=Count('blog'))
    # print(context['blog_types'][0].type_name)
    # context['blog_dates'] = models.Blog.objects.dates('create_time', 'month', order="DESC")
    context['blog_dates'] = blog_dates_dic
    return context


def blog_list(request):
    blogs_all_list = models.Blog.objects.all()
    context = get_blog_list_common_data(request, blogs_all_list)
    return render(request, 'blog/blog_list.html', context)


def blog_detail(request, blog_pk):
    context = {}
    blog = get_object_or_404(models.Blog, pk=blog_pk)
    read_cookie_key = read_statistics_once_read(request, blog)
    blog_content_type = ContentType.objects.get_for_model(blog)
    comments = Comment.objects.filter(content_type=blog_content_type, object_id=blog.pk)
    # if not request.COOKIES.get('blog_%s_readed' % blog_pk):
    #     ct = ContentType.objects.get_for_model(models.Blog)
    #     if ReadNum.objects.filter(content_type=ct,object_id=blog.pk).count():
    #         # 存在
    #         readnum = ReadNum.objects.get(content_type=ct,object_id=blog.pk)
    #         readnum.read_num += 1
    #         readnum.save()
    #     else:
    #         readnum = ReadNum(content_type=ct,object_id=blog.pk)
    #         readnum.read_num += 1
    #         readnum.save()
    context['previous_blog'] = models.Blog.objects.filter(create_time__gt=blog.create_time).last()
    context['next_blog'] = models.Blog.objects.filter(create_time__lt=blog.create_time).first()
    context['blog'] = blog
    context['comments'] = comments
    data ={}
    data['content_type']=blog_content_type.model
    data['object_id'] = blog_pk
    context['comment_form']=CommentForm(initial=data)
    # print(context)
    # 响应
    response = render(request, 'blog/blog_detail.html', context)
    response.set_cookie(read_cookie_key, 'true', max_age=60)  # 阅读cookie标记
    return response


def blogs_with_type(request, blog_type_pk):
    blog_type = get_object_or_404(models.BlogType, pk=blog_type_pk)
    blogs_all_list = models.Blog.objects.filter(blog_type=blog_type)
    context = get_blog_list_common_data(request, blogs_all_list)
    context['blog_type'] = blog_type
    return render(request, 'blog/blogs_with_type.html', context)


def blogs_with_date(request, year, month):
    blogs_all_list = models.Blog.objects.filter(create_time__year=year, create_time__month=month)
    context = get_blog_list_common_data(request, blogs_all_list)

    context['blogs_with_date'] = '%s年%s月' % (year, month)
    return render(request, 'blog/blogs_with_date.html', context)
