from django import forms
from ..models import Marca

class MarcaForm(forms.ModelForm):

    class Meta:
        model = Marca
        fields = ['nome', 'obs']

class MarcaFormExcluir(forms.ModelForm):
    class Meta:
        model = Marca
        fields = ['nome', 'obs']