from django import forms
from ..models import Destinatario

class DestinatarioForm(forms.ModelForm):  
   
    class Meta:
        model = Destinatario
        fields = ['usuario','nome', 'cnpj', 'cpf', 'data_cadastro', 'endereco', 'telefone', 'cel', 'email', 'obs']
       

class DestinatarioFormExcluir(forms.ModelForm): 
    class Meta:
        model = Destinatario
        fields = ['usuario','nome', 'cnpj', 'cpf', 'data_cadastro', 'endereco', 'telefone', 'cel', 'email', 'obs']