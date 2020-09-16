from django import forms
from ..models import Gaveta, Armario, Bancada, Estante

class GavetaForm(forms.ModelForm):

    class Meta:
        model = Gaveta
        fields = ['nome', 'sigla', 'armario', 'bancada', 'estante', 'obs']

class GavetaFormExcluir(forms.ModelForm):
    class Meta:
        model = Gaveta
        fields = ['nome', 'sigla', 'armario', 'bancada', 'estante', 'obs']