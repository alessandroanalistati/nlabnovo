from django import forms
from ..models import Equipamento, Marca, Armario, Bancada, Estante, Prateleira, Gaveta, Sala

class EquipamentoForm(forms.ModelForm):
       
    class Meta:
        model = Equipamento
        fields = ['usuario', 'nome', 'tombo',  'marca', 'data_compra', 'data_ultim_m', 'origem', 'ficha_tec', 'especficacao_t',
     'calibragem', 'sala', 'armario', 'bancada', 'estante', 'prateleira', 'gaveta', 'obs', 'foto']

class EquipamentoFormExcluir(forms.ModelForm):
    class Meta:
        model = Equipamento
        fields = ['usuario', 'nome', 'tombo',  'marca', 'data_compra', 'data_ultim_m', 'origem', 'ficha_tec', 'especficacao_t',
     'calibragem', 'sala', 'armario', 'bancada', 'estante', 'prateleira', 'gaveta', 'obs', 'foto']