from ..models import Diverso

def cadastrar_diverso(diverso):
    Diverso.objects.create(nome=diverso.nome, marca=diverso.marca, unidade=diverso.unidade, quantidade=diverso.quantidade, origem=diverso.origem, 
    ficha_tec=diverso.ficha_tec, sala=diverso.sala, armario=diverso.armario, bancada=diverso.bancada, estante=diverso.estante, 
    prateleira=diverso.prateleira, gaveta=diverso.gaveta, imagem=diverso.imagem, obs=diverso.obs )

def listar_diversos ():
    diversos = Diverso.objects.all()
    return diversos

def listar_diverso_id(id):
    diverso = Diverso.objects.get(id=id)
    return diverso

def editar_diverso(diverso, diverso_novo):
    # SQL Injection
    # with connection.cursor() as cursor:
    #     nome = "'Carlos' , email = 'ana@mail.com'"
    #     cursor.execute(f"UPDATE diversos_diverso SET nome={nome} WHERE id=2")
    diverso.nome = diverso_novo.nome   
    diverso.marca = diverso_novo.marca     
    diverso.unidade = diverso_novo.unidade    
    diverso.quantidade = diverso_novo.quantidade    
    diverso.origem = diverso_novo.origem    
    diverso.ficha_tec = diverso_novo.ficha_tec    
    diverso.sala = diverso_novo.sala
    diverso.quantidade = diverso_novo.quantidade
    diverso.armario = diverso_novo.armario
    diverso.bancada = diverso_novo.bancada
    diverso.estante = diverso_novo.estante
    diverso.prateleira = diverso_novo.prateleira
    diverso.gaveta = diverso_novo.gaveta
    diverso.imagem = diverso_novo.imagem
    diverso.obs = diverso_novo.obs
   

    diverso.save(force_update=True)    

def remover_diverso(diverso):
    diverso.delete()

def visualizar_diverso(id):
    diverso = Diverso.objects.get(id=id)
    return diverso