from django.shortcuts import render, redirect
from django.db.models import Q
from .models import TblAttraction, TblProject, TblMember, TblProjectAttraction
import random 
import datetime
from django.views.decorators.csrf import  csrf_exempt
from django.contrib import messages
from django.views import View
from django.utils.decorators import method_decorator

# Create your views here.

@method_decorator(csrf_exempt, name='dispatch')
class Loginpage(View):
    def get(self, request):
        return render(request, "LoginPage.html")
        
    def post(self, request):
        input_gmail = request.POST['gmail']
        input_password = request.POST['password']
        #驗證輸入的帳號密碼
        
        if TblMember.objects.filter(gmail = input_gmail, password = input_password ).exists():
            request.session['user_id'] = TblMember.objects.get(gmail = input_gmail, password = input_password ).id_member
            return redirect('/main/')

        if not(TblMember.objects.filter(gmail = input_gmail).exists()):
            messages.info(request,'Havent registered yet ?')
            return render(request, "LoginPage.html")
        
        if TblMember.objects.filter(gmail = input_gmail).exists():
            login_member_pswd = TblMember.objects.get(gmail = input_gmail).password
            if not(login_member_pswd == input_password):
                messages.info(request,'Please check your password !')
        
    
        return render(request, "LoginPage.html")


@method_decorator(csrf_exempt, name='dispatch')
class register(View):
    def get(self, request):
        return render(request,"Register.html")
    
    def post(self, request):
        member = TblMember()
        member.create_time = datetime.datetime.now()
        member.name = request.POST.get('name')
        member.gmail = request.POST.get('gmail')
        member.password = request.POST.get('password')
        confirmpwd = request.POST.get('confirmpwd')

        #輸入密碼與確認密碼是否一樣
        if member.password != confirmpwd:
            messages.info(request,'Please check if two passwords are the same!')
            return render(request,"Register.html")
        #檢查是否有欄位為空值
        elif member.name == "" or member.gmail == "" or member.password == "" or confirmpwd == "":
            messages.info(request,'You Have Some Missing Fields!')
            return render(request,"Register.html")
        elif TblMember.objects.filter(gmail = request.POST.get('gmail')).exists():
            messages.info(request,'This gmail has registered!')
            return render(request,"Register.html")
        else:
            member.save()
            return redirect('Loginpage')



def pswd_cahnge(request):
    old_password = request.POST['old_password']
    new_password = request.POST['new_password']
    confirm_pwd = request.POST['confirmpwd']

    member = TblMember.objects.get(id_member = request.session.get('user_id'))

    if new_password == confirm_pwd and member.password == old_password:
        member.password = new_password
        member.save()


#主頁面
#隨機產生八個景點
@method_decorator(csrf_exempt, name='dispatch') 
class main_page(View):
    
    def get_info(self, request):
        request.session['user_name'] = TblMember.objects.get(id_member = request.session.get('user_id')).name
        user_name = request.session.get('user_name')
        attract = TblAttraction.objects.values_list('id_attraction',flat=True).distinct()
        attract_list = list(attract)
        show = random.sample(attract_list, 8)
        spot_search = TblAttraction.objects.filter( id_attraction__in = show)
        context = {
            'spot_search':spot_search,
            'user_name':user_name
        }
        return context
    


    def get(self, request):
        context = self.get_info(request)
        return render(request,"MainPage.html", context)

    def post(self,request):
        if 'change_password' in request.POST:
            pswd_cahnge(request)

        if 'Logout' in request.POST:
            return redirect('Loginpage')

        context = self.get_info(request)
        return render(request,"MainPage.html", context)

#景點目錄
@method_decorator(csrf_exempt, name='dispatch') 
class attractions(View):
    # 關鍵字搜尋景點
    def search(self, request):
        q = request.GET.get('q') if request.GET.get('q') != None else ''
        spot_search = TblAttraction.objects.filter(
            Q(name__icontains=q) | Q(detail__icontains = q)
        )
        return spot_search 


    def info_and_search(self, request):
        user_name = request.session.get('user_name')
        spot_search = self.search(request)
        context = {
            'user_name':user_name,
            'spot_search':spot_search
        }
        return context


    def get(self, request):
        context = self.info_and_search(request)
        return render(request, "Attractions.html", context)
    
    def post(self,request):
        
        if 'change_password' in request.POST:
            pswd_cahnge(request)

        if 'Logout' in request.POST:
            return redirect('Loginpage')

        context = self.info_and_search(request)
        return render(request, "Attractions.html", context)

#專案管理頁面
@method_decorator(csrf_exempt, name='dispatch') 
class plan_manager(View):

    def user_info(self, request):
        user_name = request.session.get('user_name')
        global user
        user = TblMember.objects.get(id_member = request.session.get('user_id'))
        project = TblProject.objects.filter(id_member_project = user)
        current_datetime = datetime.date.today()+datetime.timedelta(days=-1)
        context = {
            'project':project, 
            'now':current_datetime , 
            'user_name':user_name
        }
        return context

    # Create
    def create(self, request):
        title = request.POST['new_title']
        time = datetime.datetime.now()
        new_project = TblProject( id_member_project = user, name = title, create_time = time)
        new_project.start_time = datetime.date.today()
        new_project.save()

    # delete
    def delete(self, request):
        id = request.POST['del']
        dproject_attrac = TblProjectAttraction.objects.filter(id_project_pa = id)
        dproject = TblProject.objects.get(id_project = id)
        dproject_attrac.delete()
        dproject.delete()



    def get(self, request):
        context = self.user_info(request)
        return render(request, "PlanManager.html", context)

    def post(self, request):   
        
        if 'create' in request.POST:
            self.create(request)
        
        if 'del' in request.POST:
            self.delete(request)

        # password change
        if'pswd_change' in request.POST:
            pswd_cahnge(request)

        if 'Logout' in request.POST:
            return redirect('Loginpage')

        context = self.user_info(request)
        return render(request, "PlanManager.html", context)



#行程安排畫面
@method_decorator(csrf_exempt, name='dispatch')  
class plan(View):
    # 搜尋功能
    def search(self, request):
        if(request.GET.get('q','台北') != ""):
            q = request.GET.get('q','台北')
            request.session['q'] = request.GET.get('q','台北')
        else:
            q = request.session.get('q')
            
        spot_search = TblAttraction.objects.filter(
            Q(name__icontains=q) | Q(detail__icontains = q)
        )
        return spot_search
    
    def user_info(self, request):
        user_name = request.session.get('user_name')
        #識別使用者 點擊Edit後執行
        if request.GET.get('id_project') != None:
            id = request.GET.get('id_project')
            project = TblProject.objects.get(id_project = id)
            request.session['id_project'] = project.id_project
            time = datetime.datetime.now()
            project.modify_time = time
            project.save()

        global project_id
        project_id = request.session.get('id_project')
    
        attraction_in_project = TblProjectAttraction.objects.filter(id_project_pa = project_id).order_by('time')
        
        project_name = (TblProject.objects.get(id_project = project_id)).name
        project_time = (TblProject.objects.get(id_project = project_id)).start_time

        spot_search = self.search(request)

        context = {
            'spot_search':spot_search,
            'project_name':project_name,
            'project_time':project_time,
            'attraction': attraction_in_project,
            'user_name':user_name
            }
        return context
    
    # add attraction to project
    def add(self, request):
        Project_id = TblProject.objects.get(id_project = request.session.get('id_project'))
        Attraction_id = TblAttraction.objects.get(id_attraction = request.POST['add'])  
        if not(TblProjectAttraction.objects.filter(id_project_pa = Project_id, id_attraction_pa = Attraction_id).exists()):
            new_attraction = TblProjectAttraction(id_project_pa = Project_id, id_attraction_pa = Attraction_id)
            new_attraction.time = '00:00'
            new_attraction.save()

    # delete attraction from project
    def delete(self, request):
        Project_id = TblProject.objects.get(id_project = request.session.get('id_project'))
        Attraction_id = TblAttraction.objects.get(id_attraction = request.POST['del'])
        object_to_delete = TblProjectAttraction.objects.get(id_project_pa = Project_id, id_attraction_pa = Attraction_id)
        object_to_delete.delete()
    
    # modify project time
    def day_set(self, request):
        time = request.POST['day_set']
        object = TblProject.objects.get(id_project = project_id)
        object.start_time = time
        object.save()

    # modify attraction time
    def time_modify(self, request):
        attraction_time = request.POST['attraction_time']
        attract = TblProjectAttraction.objects.get(id_project_pa = project_id, id_attraction_pa = request.POST['attraction_id'])
        attract.time = attraction_time
        attract.save()


    def get(self, request):
        context = self.user_info(request)
        return render(request, "Plan.html", context)

    def post(self, request): 
        
        if 'add' in request.POST:
            self.add(request)

        if 'del' in request.POST:
            self.delete(request)

        if 'pswd_change' in request.POST:
            pswd_cahnge(request)

        if 'day_set' in request.POST:
            self.day_set(request)

        if 'attraction_time' in request.POST:
             self.time_modify(request)
        
        if 'Logout' in request.POST:
            return redirect('Loginpage')

        context = self.user_info(request)
        return render(request, "Plan.html", context)



