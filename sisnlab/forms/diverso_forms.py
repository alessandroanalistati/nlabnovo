from django import forms
from ..models import Diverso, Marca, Sala, Armario, Bancada, Estante, Prateleira, Gaveta, Unidade

class DiversoForm(forms.ModelForm):
       
    class Meta:
        model = Diverso
        fields = ['nome', 'marca', 'unidade', 'quantidade', 'origem', 'ficha_tec', 'sala', 'armario',
                  'bancada', 'estante', 'prateleira', 'gaveta', 'imagem', 'obs']

class DiversoFormExcluir(forms.ModelForm):
    class Meta:
        model = Diverso
        fields = ['nome', 'marca', 'unidade', 'quantidade', 'origem', 'ficha_tec', 'sala', 'armario',
                  'bancada', 'estante', 'prateleira', 'gaveta', 'imagem', 'obs']
