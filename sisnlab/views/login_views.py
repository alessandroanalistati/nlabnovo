from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth import authenticate, login
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout


def login_user(request):    
    return render(request, 'login/login.html')

@csrf_protect
def submit_login(request):
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('sisnlab:dashboard')
        else:
            messages.error(request, 'Usuário/Senha inválidos. Favor tentar novamente.')
    return redirect('/nlab/login/')

@login_required(login_url='/nlab/login/')
def inicio(request):    
    return render(request, 'login/dashboard.html')

def logout_user(request):
    logout(request)
    return redirect('sisnlab:dashboard')


