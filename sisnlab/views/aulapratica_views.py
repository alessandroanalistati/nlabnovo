import sys
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from ..forms import aulapratica_forms
from ..forms import itensaulapratica_forms
from ..entidades import aulapratica
from ..entidades import itensaulapratica
from ..services import aulapratica_service
from ..services import itensaulapratica_service
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from ..models import AulaPratica
from ..models import ItensAulaPratica
from ..models import Reagente
from ..models import AulaPratica



@login_required(login_url='/nlab/login/')
def listar_aulapratica(request):
    aulapraticas = aulapratica_service.listar_aulapraticas()
    return render(request, 'aulapraticas/listar_aulapraticas.html', {'aulapraticas': aulapraticas})

@login_required(login_url='/nlab/login/')
def inserir_aulapratica(request):
    if request.method == "POST":
        form_aulapratica = aulapratica_forms.AulaPraticaForm(request.POST, request.FILES)      
        if form_aulapratica.is_valid():            
            usuario = form_aulapratica.cleaned_data["usuario"]
            nome = form_aulapratica.cleaned_data["nome"]   
            sala = form_aulapratica.cleaned_data["sala"]
            data_inicio = form_aulapratica.cleaned_data["data_inicio"]                
            data_fim = form_aulapratica.cleaned_data["data_fim"]                
            quantalunos = form_aulapratica.cleaned_data["quantalunos"]     
            obs = form_aulapratica.cleaned_data["obs"]  
            status = form_aulapratica.cleaned_data["status"]            

            aulapratica_novo = aulapratica.AulaPratica(usuario=request.user, nome=nome, sala=sala, data_inicio=data_inicio, 
            data_fim=data_fim, quantalunos=quantalunos, obs=obs, status=status)  
                       
            aulapratica_service.cadastrar_aulapratica(aulapratica_novo) 
                   
            aulapratica_novo = AulaPratica.objects.filter(usuario=request.user).last()
            
            return render(request, 'aulapraticas/itensaulapratica.html', {'aulapratica_novo': aulapratica_novo})  
    else:
        form_aulapratica = aulapratica_forms.AulaPraticaForm()   
    return render(request, 'aulapraticas/form_aulapratica.html', {'form_aulapratica': form_aulapratica})

@login_required(login_url='/nlab/login/')
def listar_aulapratica_id(request, id):
    aulapratica = aulapratica_service.listar_aulapratica_id(id)

    return render(request, 'aulapraticas/lista_aulapratica.html', {'aulapratica': aulapratica})

@login_required(login_url='/nlab/login/')
def editar_aulapratica(request, id):
    aulapratica_antigo = aulapratica_service.listar_aulapratica_id(id)
    form_aulapratica = aulapratica_forms.AulaPraticaForm(request.POST or None, instance=aulapratica_antigo)   
    if form_aulapratica.is_valid():
            usuario = form_aulapratica.cleaned_data["usuario"]
            nome = form_aulapratica.cleaned_data["nome"]   
            sala = form_aulapratica.cleaned_data["sala"]
            data_inicio = form_aulapratica.cleaned_data["data_inicio"]                
            data_fim = form_aulapratica.cleaned_data["data_fim"]                
            quantalunos = form_aulapratica.cleaned_data["quantalunos"]     
            obs = form_aulapratica.cleaned_data["obs"]  
            status = form_aulapratica.cleaned_data["status"]            

            aulapratica_novo = aulapratica.AulaPratica(usuario=request.user, nome=nome, sala=sala, data_inicio=data_inicio, data_fim=data_fim,
            quantalunos=quantalunos, obs=obs, status=status)  
            aulapratica_service.editar_aulapratica(aulapratica_antigo, aulapratica_novo)

            return redirect('sisnlab:listar_aulapraticas')       
    return render(request, 'aulapraticas/form_aulapratica.html', {'form_aulapratica': form_aulapratica})  
@login_required(login_url='/nlab/login/')
def remover_aulapratica(request, id):
    aulapratica = aulapratica_service.listar_aulapratica_id(id)
    if request.method == "POST":
        aulapratica_service.remover_aulapratica(aulapratica)
        return redirect('sisnlab:listar_aulapraticas')
    return render(request, 'aulapraticas/confirma_exclusao.html', {'aulapratica': aulapratica})

@login_required(login_url='/nlab/login/')
def visualizar_aulapratica(request, id):
    aulapratica = aulapratica_service.listar_aulapratica_id(id)    
    itensaulapratica = ItensAulaPratica.objects.filter(aulapratica_id=id)  
    
    if request.method == "POST":
        aulapratica_service.visualizar_aulapratica(aulapratica)
        return redirect('sisnlab:listar_aulapraticas')
    return render(request, 'aulapraticas/visualizar.html', {'aulapratica': aulapratica, 'itensaulapratica' : itensaulapratica})    


@login_required(login_url='/nlab/login/')
def produtos_aulapraticas(request, aulapratica_id ):
    aulapratica = AulaPratica.objects.get(id=aulapratica_id)      
    if request.method == "POST":               
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm(request.POST)      
        if form_itensaulapratica.is_valid():            
            usuario = form_itensaulapratica.cleaned_data["usuario"]                             
            aulapratica_id = form_itensaulapratica.cleaned_data["aulapratica_id"]   
            reagente = form_itensaulapratica.cleaned_data["reagente"]
            unidade = form_itensaulapratica.cleaned_data["unidade"]                   
            quant_reagente = form_itensaulapratica.cleaned_data["quant_reagente"]          
                                 

        itensaulapratica_novo = itensaulapratica.ItensAulaPratica(usuario=request.user, aulapratica_id=aulapratica.id, 
            reagente=reagente, unidade=unidade, quant_reagente=quant_reagente)                       
    
        itensaulapratica_service.cadastrar_itensaulapratica(itensaulapratica_novo)         
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm()     
           
            
    else:                
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm() 
    return render(request, 'aulapraticas/cadastrariprodutosaula.html', {'form_itensaulapratica': form_itensaulapratica})


@login_required(login_url='/nlab/login/')
def equipamentos_aulapraticas(request, aulapratica_id ):
    aulapratica = AulaPratica.objects.get(id=aulapratica_id)      
    if request.method == "POST":               
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm(request.POST)      
        if form_itensaulapratica.is_valid():            
            usuario = form_itensaulapratica.cleaned_data["usuario"]                             
            aulapratica_id = form_itensaulapratica.cleaned_data["aulapratica_id"]                 
            equipamentos = form_itensaulapratica.cleaned_data["equipamentos"]                           
            quant_equipamento = form_itensaulapratica.cleaned_data["quant_equipamento"]                             

        itensaulapratica_novo = itensaulapratica.ItensAulaPratica(usuario=request.user, aulapratica_id=aulapratica.id,
        equipamentos=equipamentos, quant_equipamento=quant_equipamento)                       
    
        itensaulapratica_service.cadastrar_itensaulapratica(itensaulapratica_novo)       
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm()     
           
            
    else:                
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm()  
    return render(request, 'aulapraticas/cadastrarequipamentosaula.html', {'form_itensaulapratica': form_itensaulapratica})



@login_required(login_url='/nlab/login/')
def solucoes_aulapraticas(request, aulapratica_id ):
    aulapratica = AulaPratica.objects.get(id=aulapratica_id)      
    if request.method == "POST":               
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm(request.POST)      
        if form_itensaulapratica.is_valid():            
            usuario = form_itensaulapratica.cleaned_data["usuario"]                             
            aulapratica_id = form_itensaulapratica.cleaned_data["aulapratica_id"]                 
            solucao = form_itensaulapratica.cleaned_data["solucao"]                        
            quant_solucao = form_itensaulapratica.cleaned_data["quant_solucao"]                         

        itensaulapratica_novo = itensaulapratica.ItensAulaPratica(usuario=request.user, aulapratica_id=aulapratica.id, 
        solucao=solucao, quant_solucao=quant_solucao)                       
    
        itensaulapratica_service.cadastrar_itensaulapratica(itensaulapratica_novo)         
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm()          
            
    else:                
        form_itensaulapratica = itensaulapratica_forms.ItensAulaPraticaForm() 
    return render(request, 'aulapraticas/cadastrarsolucaoaula.html', {'form_itensaulapratica': form_itensaulapratica})


@login_required(login_url='/nlab/login/')
def visualizar_aulapraticaitens(request, id):       
    aulapraticaitens = AulaPratica.objects.filter(usuario=request.user).last() 
    itensaulapratica = ItensAulaPratica.objects.filter(aulapratica_id=id)  
    
    return redirect('sisnlab:listar_aulapraticas')     
  
def pega_ultima_solucao(request):
    ultimo_id_solucao = AulaPratica.objects.filter(usuario=request.user).last() 
    aulapratica = AulaPratica.objects.get(id=ultimo_id_solucao.pk)
    itensaulapratica = ItensAulaPratica.objects.filter(aulapratica_id=ultimo_id_solucao.pk)  
    return render(request, 'aulapraticas/visualizar.html', {'aulapratica': aulapratica, 'itensaulapratica' : itensaulapratica})    

