import sys
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from ..forms import equipamento_forms
from ..entidades import equipamento
from ..services import equipamento_service
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout


@login_required(login_url='/nlab/login/')
def listar_equipamento(request):
    equipamentos = equipamento_service.listar_equipamentos()
    return render(request, 'equipamentos/listar_equipamentos.html', {'equipamentos': equipamentos})

@login_required(login_url='/nlab/login/')
def inserir_equipamento(request):
    if request.method == "POST":
        form_equipamento = equipamento_forms.EquipamentoForm(request.POST, request.FILES)   
        if form_equipamento.is_valid():
            usuario = form_equipamento.cleaned_data["usuario"] 
            nome = form_equipamento.cleaned_data["nome"] 
            tombo = form_equipamento.cleaned_data["tombo"]          
            marca = form_equipamento.cleaned_data["marca"]            
            data_compra = form_equipamento.cleaned_data["data_compra"]
            data_ultim_m = form_equipamento.cleaned_data["data_ultim_m"]
            origem = form_equipamento.cleaned_data["origem"]
            ficha_tec = form_equipamento.cleaned_data["ficha_tec"]
            especficacao_t = form_equipamento.cleaned_data["especficacao_t"]
            calibragem = form_equipamento.cleaned_data["calibragem"]
            sala = form_equipamento.cleaned_data["sala"]
            armario = form_equipamento.cleaned_data["armario"]
            bancada = form_equipamento.cleaned_data["bancada"]
            estante = form_equipamento.cleaned_data["estante"]
            prateleira = form_equipamento.cleaned_data["prateleira"]
            gaveta = form_equipamento.cleaned_data["gaveta"]           
            obs = form_equipamento.cleaned_data["obs"]
            foto = form_equipamento.cleaned_data["foto"]

            equipamento_novo = equipamento.Equipamento(usuario=request.user, nome=nome, tombo=tombo, marca=marca, 
            data_compra=data_compra, data_ultim_m=data_ultim_m, origem=origem, ficha_tec=ficha_tec, 
            especficacao_t=especficacao_t, calibragem=calibragem, sala=sala, armario=armario, bancada=bancada, 
            estante=estante, prateleira=prateleira, gaveta=gaveta, obs=obs, foto=foto)
            
            equipamento_service.cadastrar_equipamento(equipamento_novo)
            
            return redirect('sisnlab:listar_equipamentos')
    else:
        form_equipamento = equipamento_forms.EquipamentoForm()   
    return render(request, 'equipamentos/form_equipamento.html', {'form_equipamento': form_equipamento})

@login_required(login_url='/nlab/login/')
def listar_equipamento_id(request, id):
    equipamento = equipamento_service.listar_equipamento_id(id)

    return render(request, 'equipamentos/lista_equipamento.html', {'equipamento': equipamento})

@login_required(login_url='/nlab/login/')
def editar_equipamento(request, id):
    equipamento_antigo = equipamento_service.listar_equipamento_id(id)
    form_equipamento = equipamento_forms.EquipamentoForm(request.POST or None, instance=equipamento_antigo)   
    if form_equipamento.is_valid():
        if form_equipamento.is_valid():
            usuario = form_equipamento.cleaned_data["usuario"] 
            nome = form_equipamento.cleaned_data["nome"] 
            tombo = form_equipamento.cleaned_data["tombo"]          
            marca = form_equipamento.cleaned_data["marca"]            
            data_compra = form_equipamento.cleaned_data["data_compra"]
            data_ultim_m = form_equipamento.cleaned_data["data_ultim_m"]
            origem = form_equipamento.cleaned_data["origem"]
            ficha_tec = form_equipamento.cleaned_data["ficha_tec"]
            especficacao_t = form_equipamento.cleaned_data["especficacao_t"]
            calibragem = form_equipamento.cleaned_data["calibragem"]
            sala = form_equipamento.cleaned_data["sala"]
            armario = form_equipamento.cleaned_data["armario"]
            bancada = form_equipamento.cleaned_data["bancada"]
            estante = form_equipamento.cleaned_data["estante"]
            prateleira = form_equipamento.cleaned_data["prateleira"]
            gaveta = form_equipamento.cleaned_data["gaveta"]           
            obs = form_equipamento.cleaned_data["obs"]
            foto = form_equipamento.cleaned_data["foto"]

            equipamento_novo = equipamento.Equipamento(usuario=request.user, nome=nome, tombo=tombo, marca=marca, 
            data_compra=data_compra, data_ultim_m=data_ultim_m, origem=origem, ficha_tec=ficha_tec, 
            especficacao_t=especficacao_t, calibragem=calibragem, sala=sala, armario=armario, bancada=bancada, 
            estante=estante, prateleira=prateleira, gaveta=gaveta, obs=obs, foto=foto)
            
            equipamento_service.editar_equipamento(equipamento_antigo, equipamento_novo)

            return redirect('sisnlab:listar_equipamentos')
        
    return render(request, 'equipamentos/form_equipamento.html', {'form_equipamento': form_equipamento})  

@login_required(login_url='/nlab/login/')
def remover_equipamento(request, id):
    equipamento = equipamento_service.listar_equipamento_id(id)
    if request.method == "POST":
        equipamento_service.remover_equipamento(equipamento)
        return redirect('sisnlab:listar_equipamentos')
    return render(request, 'equipamentos/confirma_exclusao.html', {'equipamento': equipamento})

@login_required(login_url='/nlab/login/')
def visualizar_equipamento(request, id):
    equipamento = equipamento_service.listar_equipamento_id(id)
    if request.method == "POST":
        equipamento_service.visualizar_equipamento(equipamento)
        return redirect('sisnlab:listar_equipamentos')
    return render(request, 'equipamentos/visualizar.html', {'equipamento': equipamento})


# form_equipamento = equipamento_forms.EquipamentoForm( initial={"armario": "1", "bancada": "1", "estante": "1", "prateleira": "1", "gaveta": "1",})   