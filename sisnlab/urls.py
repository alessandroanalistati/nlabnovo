import sys     
from django.contrib import admin
from django.urls import path
from django.contrib.staticfiles.urls import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from nlab import settings

from sisnlab.views.sala_views import *
from sisnlab.views.armario_views import *
from sisnlab.views.estante_views import *
from sisnlab.views.tombo_views import *
from sisnlab.views.bancada_views import *
from sisnlab.views.prateleira_views import *
from sisnlab.views.gaveta_views import *
from sisnlab.views.marca_views import *
from sisnlab.views.equipamento_views import *
from sisnlab.views.unidade_views import *
from sisnlab.views.vidraria_views import *
from sisnlab.views.reagente_views import *
from sisnlab.views.diverso_views import *
from sisnlab.views.pedidosolucao_views import *
from sisnlab.views.login_views import *

app_name = 'sisnlab'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', login_user),          
    path('login/submit', submit_login),
    path('logout/', logout_user),
    path('dashboard', inicio, name='dashboard'),
    
          
    path('listar_salas', listar_sala, name='listar_salas'),
    path('cadastrar_sala', inserir_sala, name='cadastrar_sala'),
    path('listar_sala/<int:id>', listar_sala_id, name='listar_sala_id'),
    path('editar_sala/<int:id>', editar_sala, name='editar_sala'),
    path('removersala/<int:id>', remover_sala, name='remover_sala'),
    
    path('listar_armarios', listar_armario, name='listar_armarios'),
    path('cadastrar_armario', inserir_armario, name='cadastrar_armario'),
    path('listar_armario/<int:id>', listar_armario_id, name='listar_armario_id'),
    path('editar_armario/<int:id>', editar_armario, name='editar_armario'),
    path('remover_armario/<int:id>', remover_armario, name='remover_armario'),
    path('visualizar_armario/<int:id>', visualizar_armario, name='visualizar_armario'),

    path('listar_tombos', listar_tombo, name='listar_tombos'),
    path('cadastrar_tombo', inserir_tombo, name='cadastrar_tombo'),
    path('listar_tombo/<int:id>', listar_tombo_id, name='listar_tombo_id'),
    path('editar_tombo/<int:id>', editar_tombo, name='editar_tombo'),
    path('remover_tombo/<int:id>', remover_tombo, name='remover_tombo'),


    path('listar_estantes', listar_estante, name='listar_estantes'),
    path('cadastrar_estante', inserir_estante, name='cadastrar_estante'),
    path('listar_estante/<int:id>', listar_estante_id, name='listar_estante_id'),
    path('editar_estante/<int:id>', editar_estante, name='editar_estante'),
    path('remover_estante/<int:id>', remover_estante, name='remover_estante'),

    path('listar_bancadas', listar_bancada, name='listar_bancadas'),
    path('cadastrar_bancada', inserir_bancada, name='cadastrar_bancada'),
    path('listar_bancada/<int:id>', listar_bancada_id, name='listar_bancada_id'),
    path('editar_bancada/<int:id>', editar_bancada, name='editar_bancada'),
    path('remover_bancada/<int:id>', remover_bancada, name='remover_bancada'),

    path('listar_prateleiras', listar_prateleira, name='listar_prateleiras'),
    path('cadastrar_prateleira', inserir_prateleira, name='cadastrar_prateleira'),
    path('listar_prateleira/<int:id>', listar_prateleira_id, name='listar_prateleira_id'),
    path('editar_prateleira/<int:id>', editar_prateleira, name='editar_prateleira'),
    path('remover_prateleira/<int:id>', remover_prateleira, name='remover_prateleira'),

    path('listar_gavetas', listar_gaveta, name='listar_gavetas'),
    path('cadastrar_gaveta', inserir_gaveta, name='cadastrar_gaveta'),
    path('listar_gaveta/<int:id>', listar_gaveta_id, name='listar_gaveta_id'),
    path('editar_gaveta/<int:id>', editar_gaveta, name='editar_gaveta'),
    path('remover_gaveta/<int:id>', remover_gaveta, name='remover_gaveta'),

    path('listar_marcas', listar_marca, name='listar_marcas'),
    path('cadastrar_marca', inserir_marca, name='cadastrar_marca'),
    path('listar_marca/<int:id>', listar_marca_id, name='listar_marca_id'),
    path('editar_marca/<int:id>', editar_marca, name='editar_marca'),
    path('remover_marca/<int:id>', remover_marca, name='remover_marca'),

    path('listar_equipamentos', listar_equipamento, name='listar_equipamentos'),
    path('cadastrar_equipamento', inserir_equipamento, name='cadastrar_equipamento'),
    path('listar_equipamento/<int:id>', listar_equipamento_id, name='listar_equipamento_id'),
    path('editar_equipamento/<int:id>', editar_equipamento, name='editar_equipamento'),
    path('remover_equipamento/<int:id>', remover_equipamento, name='remover_equipamento'),
    path('visualizar_equipamento/<int:id>', visualizar_equipamento, name='visualizar_equipamento'),

    path('listar_unidades', listar_unidade, name='listar_unidades'),
    path('cadastrar_unidade', inserir_unidade, name='cadastrar_unidade'),
    path('listar_unidade/<int:id>', listar_unidade_id, name='listar_unidade_id'),
    path('editar_unidade/<int:id>', editar_unidade, name='editar_unidade'),
    path('remover_unidade/<int:id>', remover_unidade, name='remover_unidade'),    

    path('listar_vidrarias', listar_vidraria, name='listar_vidrarias'),
    path('cadastrar_vidraria', inserir_vidraria, name='cadastrar_vidraria'),
    path('listar_vidraria/<int:id>', listar_vidraria_id, name='listar_vidraria_id'),
    path('editar_vidraria/<int:id>', editar_vidraria, name='editar_vidraria'),
    path('remover_vidraria/<int:id>', remover_vidraria, name='remover_vidraria'),
    path('visualizar_vidraria/<int:id>', visualizar_vidraria, name='visualizar_vidraria'),

    path('listar_reagentes', listar_reagente, name='listar_reagentes'),
    path('cadastrar_reagente', inserir_reagente, name='cadastrar_reagente'),
    path('listar_reagente/<int:id>', listar_reagente_id, name='listar_reagente_id'),
    path('editar_reagente/<int:id>', editar_reagente, name='editar_reagente'),
    path('remover_reagente/<int:id>', remover_reagente, name='remover_reagente'),
    path('visualizar_reagente/<int:id>', visualizar_reagente, name='visualizar_reagente'),

    path('listar_diversos', listar_diverso, name='listar_diversos'),
    path('cadastrar_diverso', inserir_diverso, name='cadastrar_diverso'),
    path('listar_diverso/<int:id>', listar_diverso_id, name='listar_diverso_id'),
    path('editar_diverso/<int:id>', editar_diverso, name='editar_diverso'),
    path('remover_diverso/<int:id>', remover_diverso, name='remover_diverso'),
    path('visualizar_diverso/<int:id>', visualizar_diverso, name='visualizar_diverso'),
    
    path('listar_pedidosolucoes', listar_pedidosolucao, name='listar_pedidosolucoes'),
    path('cadastrar_pedidosolucao', inserir_pedidosolucao, name='cadastrar_pedidosolucao'),
    path('listar_pedidosolucao/<int:id>', listar_pedidosolucao_id, name='listar_pedidosolucao_id'),
    path('editar_pedidosolucao/<int:id>', editar_pedidosolucao, name='editar_pedidosolucao'),
    path('remover_pedidosolucao/<int:id>', remover_pedidosolucao, name='remover_pedidosolucao'),
    path('visualizar_pedidosolucao/<int:id>', visualizar_pedidosolucao, name='visualizar_pedidosolucao'),    
    path('itens_pedidosolucoes/<int:pedidosolucao_id>', itens_pedidosolucoes, name='itens_pedidosolucoes'),
    path('visualizar_pedidosolucaoitens/<int:id>', visualizar_pedidosolucaoitens, name='visualizar_pedidosolucaoitens'),

    
]

urlpatterns += staticfiles_urlpatterns()
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)