from django import forms
from ..models import Estante, Sala


class EstanteForm(forms.ModelForm):
    
    class Meta:
        model = Estante
        fields = ['nome', 'sigla', 'tombo', 'sala', 'obs']

class EstanteFormExcluir(forms.ModelForm):
    class Meta:
        model = Estante
        fields = ['nome', 'sigla', 'tombo', 'sala', 'obs']