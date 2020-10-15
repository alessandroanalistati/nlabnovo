from django import forms
from django.contrib.auth.models import User
from ..models import AulaPratica, Reagente, Marca, Sala, Unidade

class AulaPraticaForm(forms.ModelForm):
       
    class Meta:
        model = AulaPratica
        fields = ['usuario', 'nome', 'sala', 'data_inicio', 'data_fim', 'quantalunos', 'obs', 'status']       
        
        
class AulaPraticaFormExcluir(forms.ModelForm):
    class Meta:
        model = AulaPratica
        fields = ['usuario', 'nome', 'sala', 'data_inicio', 'data_fim', 'quantalunos', 'obs', 'status']    
        
        
