from django import forms
from ..models import Reagente, Marca, Sala, Armario, Bancada, Estante, Prateleira, Gaveta, Unidade

class ReagenteForm(forms.ModelForm):
       
    class Meta:
        model = Reagente
        fields = ['nome', 'formula_q', 'grau_p', 'unidade', 'marca', 'quantidade', 'data_validade', 'controle_pfex', 'ficha_tec', 
        'massamolecular', 'densidade', 'disponibilidade', 'sala', 'armario', 'bancada', 'estante', 'prateleira', 'gaveta', 'obs']

class ReagenteFormExcluir(forms.ModelForm):
    class Meta:
        model = Reagente
        fields = ['nome', 'formula_q', 'grau_p', 'unidade', 'marca', 'quantidade', 'data_validade', 'controle_pfex', 'ficha_tec', 
        'massamolecular', 'densidade', 'disponibilidade', 'sala', 'armario', 'bancada', 'estante', 'prateleira', 'gaveta', 'obs']