from django.urls import path
from . import views


urlpatterns = [
    path('', views.Loginpage.as_view(), name="Loginpage"),
    path('register/', views.register.as_view(), name="register"),
    path('main/', views.main_page.as_view(), name="main"),
    path('attractions/', views.attractions.as_view(), name="attractions"),
    path('plan_manager/', views.plan_manager.as_view(), name="plan_manager"),
    path('plan_manager/plan/', views.plan.as_view(), name="plan"),

]