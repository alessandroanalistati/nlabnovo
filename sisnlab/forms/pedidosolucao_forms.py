from django import forms
from django.contrib.auth.models import User
from ..models import PedidoSolucao, Reagente, Marca, Sala, Armario, Bancada, Estante, Prateleira, Gaveta, Unidade

class PedidoSolucaoForm(forms.ModelForm):
       
    class Meta:
        model = PedidoSolucao
        fields = ['usuario', 'nome', 'concentracao', 'data_producao', 'unidade', 'quantidade', 'status', 'sala', 
                  'armario', 'bancada', 'estante', 'prateleira', 'gaveta', 'obs', 'estoque']       
        
        
class PedidoSolucaoFormExcluir(forms.ModelForm):
    class Meta:
        model = PedidoSolucao
        fields = ['usuario', 'nome', 'concentracao', 'data_producao', 'unidade', 'quantidade', 'status', 'sala', 
                  'armario', 'bancada', 'estante', 'prateleira', 'gaveta', 'obs', 'estoque']
        
        
