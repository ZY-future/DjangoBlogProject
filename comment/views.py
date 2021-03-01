from django.shortcuts import render
from .models import Comment
from django.shortcuts import redirect, render
from django.contrib.contenttypes.models import ContentType
from django.urls import reverse
from .forms import CommentForm


# Create your views here.

def update_comment(request):
    # referer = request.META.get('HTTP_REFERER', reverse('home'))
    # # 数据检查
    # user = request.user
    # if user.is_authenticated is False:
    #     return render(request, 'error.html', {'message': '用户未登录', 'redirect_to': referer})
    #
    # text = request.POST.get('text', '').strip()
    # if text == "":
    #     return render(request, 'error.html', {'message': '评论内容为空', 'redirect_to': referer})
    # try:
    #     content_type = request.POST.get('content_type', '')
    #     object_id = int(request.POST.get('object_id', ''))
    #
    #     model_class = ContentType.objects.get(model=content_type).model_class()  # Blog
    #     model_obj = model_class.objects.get(pk=object_id)
    # except Exception as e:
    #     return render(request, 'error.html', {'message': '评论对象不存在', 'redirect_to': referer})
    # # 检查通过 保存数据
    # comment = Comment()
    # comment.user = user
    # comment.content_object = model_obj
    # comment.text = text
    # comment.save()
    # return redirect(referer)

    referer = request.META.get('HTTP_REFERER', reverse('home'))
    comment_form = CommentForm(request.POST, user=request.user)
    if comment_form.is_valid():
        # 检查通过 保存数据
        comment = Comment()
        comment.user = comment_form.cleaned_data['user']
        comment.content_object = comment_form.cleaned_data['content_object']
        comment.text = comment_form.cleaned_data['text']
        comment.save()
        return redirect(referer)
    else:
        return render(request, 'error.html', {'message': comment_form.errors, 'redirect_to': referer})
