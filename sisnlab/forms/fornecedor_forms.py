from django import forms
from ..models import Fornecedor

class FornecedorForm(forms.ModelForm):  
   
    class Meta:
        model = Fornecedor
        fields = ['usuario','nome', 'cnpj', 'cpf', 'data_cadastro', 'endereco', 'telefone', 'cel', 'email', 'obs']
       

class FornecedorFormExcluir(forms.ModelForm): 
    class Meta:
        model = Fornecedor
        fields = ['usuario','nome', 'cnpj', 'cpf', 'data_cadastro', 'endereco', 'telefone', 'cel', 'email', 'obs']