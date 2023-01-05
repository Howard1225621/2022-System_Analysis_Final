from django.urls import path, re_path as url
from django.views import static 
from django.conf import settings 
from . import views


urlpatterns = [
    path('', views.Loginpage.as_view(), name="Loginpage"),
    path('register/', views.register.as_view(), name="register"),
    path('main/', views.main_page.as_view(), name="main"),
    path('attractions/', views.attractions.as_view(), name="attractions"),
    path('plan_manager/', views.plan_manager.as_view(), name="plan_manager"),
    path('plan_manager/plan/', views.plan.as_view(), name="plan"),

    path('member_list/', views.member_list.as_view(), name="member_list"),
    path('administrator_list/', views.administrator_list.as_view(), name="administrator_list"),

    url(r'^static/(?P<path>.*)$', static.serve,
        {'document_root': settings.STATIC_ROOT}, name='static'),

]
