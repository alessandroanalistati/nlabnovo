from django.db import models
from django.utils import timezone
from django.conf import settings
from django.contrib.auth.models import User


class Sala(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.SET_NULL,  null=True, blank=True, verbose_name="UsuarioSala :" )    
    nome = models.CharField(max_length=80,  unique=True, null=False, blank=False, verbose_name="Nome :")
    obs = models.TextField(verbose_name="Observação", blank=True)

    def __str__(self):
        return self.nome

class Tombo(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.SET_NULL,  null=True, blank=True, verbose_name="UsuarioTombo :" ) 
    numero = models.CharField(max_length=6, unique=True, null=False, blank=False, verbose_name="Número :" )
    descricao = models.CharField(max_length=50, blank=False, null=False, verbose_name="Descrição :")
    

    def __str__(self):
        return self.numero + ' - ' + self.descricao

class Armario(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.SET_NULL,  null=True, blank=True, verbose_name="Usuario_Armario :" )    
    nome = models.CharField(max_length=50, unique=True,null=False, blank=False, verbose_name="Nome :")
    sigla = models.CharField(max_length=50, null=True, blank=True, verbose_name="SIGLA :")
    tombo = models.OneToOneField(Tombo, on_delete=models.SET_NULL, null=True, related_name='Tombo_Armario')    
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, blank=True, related_name='Sala_Armário')
    obs = models.TextField(verbose_name="Observação", blank=True)
    fotoarmario = models.ImageField(upload_to='images', null=True, blank=True, verbose_name="Foto_Armario")    


    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Armários'
        ordering = ['nome']

    def __str__(self):
        return self.nome


class Estante(models.Model):
    nome = models.CharField(max_length=50, null=False, blank=False, verbose_name="Nome :")
    sigla = models.CharField(max_length=50, null=True, blank=True, verbose_name="SIGLA :")
    tombo = models.OneToOneField(Tombo, on_delete=models.SET_NULL, null=True, related_name='Tombo_Estante')    
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, related_name='Sala_Estante')
    obs = models.TextField(verbose_name="Observação", null=True, blank=True)

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Estantes'
        ordering = ['nome']

    def __str__(self):
        return self.nome

class Bancada(models.Model):
    nome = models.CharField(max_length=50, blank=False, null=False, verbose_name="Nome :")
    sigla = models.CharField(max_length=50, null=True, blank=True, verbose_name="SIGLA :")
    tombo = models.OneToOneField(Tombo, on_delete=models.SET_NULL, null=True, related_name='Tombo_Bancada')    
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, related_name='Sala_Bancada')
    obs = models.TextField(verbose_name="Observação", blank=True)

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Bancadas'
        ordering = ['nome']

    def __str__(self):
        return self.nome


class Prateleira(models.Model):
    nome = models.CharField(max_length=50, null=False, verbose_name="Nome :")
    sigla = models.CharField(max_length=50, null=True, blank=True, verbose_name="SIGLA :") 
    armario = models.ForeignKey(Armario, on_delete=models.SET_NULL, null=True, blank=True, related_name='Prateleira_Armario')
    bancada = models.ForeignKey(Bancada, on_delete=models.SET_NULL, null=True, blank=True, related_name='Prateleira_bancada')
    estante = models.ForeignKey(Estante, on_delete=models.SET_NULL, null=True, blank=True, related_name='Prateleira_prateleira')    
    obs = models.TextField(verbose_name="Observação", null=True, blank=True)

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Prateleira'
        ordering = ['nome']

    def __str__(self):
        return self.nome

class Gaveta(models.Model):
    nome = models.CharField(max_length=50, null=False, verbose_name="Nome :")
    sigla = models.CharField(max_length=50, null=True, blank=True, verbose_name="SIGLA :") 
    armario = models.ForeignKey(Armario, on_delete=models.SET_NULL, null=True, blank=True, related_name='Gaveta_Armario')
    bancada = models.ForeignKey(Bancada, on_delete=models.SET_NULL, null=True, blank=True, related_name='Gaveta_bancada')
    estante = models.ForeignKey(Estante, on_delete=models.SET_NULL, null=True, blank=True, related_name='Gaveta_prateleira')       
    obs = models.TextField(verbose_name="Observação", null=True, blank=True)

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Gaveta'
        ordering = ['nome']

    def __str__(self):
        return self.nome

class Marca(models.Model):
    nome = models.CharField(max_length=50, null=False, verbose_name="Nome :")      
    obs = models.TextField(verbose_name="Observação", null=True, blank=True)

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Gaveta'
        ordering = ['nome']

    def __str__(self):
        return self.nome



class Unidade(models.Model):
    nome = models.CharField(max_length=50, null=False, verbose_name="Nome :")    
    obs = models.TextField(verbose_name="Observação", null=True, blank=True)

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Gaveta'
        ordering = ['nome']

    def __str__(self):
        return self.nome




class Equipamento(models.Model):
    CALIB_CHOICES = (
        ("SIM", "SIM"),
        ("NAO", "NÃO"),
    )
    nome = models.CharField(max_length=100, null=False, verbose_name="Nome :")
    tombo = models.OneToOneField(Tombo, on_delete=models.SET_NULL, null=True, related_name='Equipamento_tombo')   
    marca = models.ForeignKey(Marca, on_delete=models.PROTECT, related_name='Equipamento_Marca')
    data_compra =  models.DateTimeField(default=timezone.now)
    data_ultim_m =  models.DateTimeField(default=timezone.now)
    origem = models.ImageField(upload_to='images', null=False, blank=True, verbose_name="Anexar PDF ou imagem :")
    ficha_tec = models.ImageField(upload_to='images', null=False, blank=True, verbose_name="Ficha Técnica :")
    especficacao_t = models.TextField(null=False, blank=True, verbose_name="Especificação Técnica")
    calibragem = models.CharField(max_length=3, null=False, blank=True, choices=CALIB_CHOICES)    
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, related_name='Equipamento_Sala')
    armario = models.ForeignKey(Armario, on_delete=models.SET_NULL, null=True, blank=True, related_name='Equipamento_Armario')
    bancada = models.ForeignKey(Bancada, on_delete=models.SET_NULL, null=True, blank=True, related_name='Equipamento_bancada')
    estante = models.ForeignKey(Estante, on_delete=models.SET_NULL, null=True, blank=True, related_name='Equipamento_prateleira') 
    prateleira = models.ForeignKey(Prateleira, on_delete=models.SET_NULL, null=True, blank=True, related_name='Equipamento_gaveta') 
    gaveta = models.ForeignKey(Gaveta, on_delete=models.SET_NULL, null=True, blank=True, related_name='Equipamento_Gavera') 
    obs = models.TextField(verbose_name="Observação", blank=True)
      

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Equipamentos'
        ordering = ['nome']     
       

    def __str__(self):
         return self.nome		
	   	
		
class Vidraria(models.Model):
    CALIB_CHOICES = (
        ("SIM", "SIM"),
        ("NAO", "NÃO"),
    )
    nome = models.CharField(max_length=100, null=False, verbose_name="Nome :")    
    marca = models.ForeignKey(Marca, on_delete=models.PROTECT, null=True, blank=True, related_name='Marca_vidraria')
    data_compra =  models.DateTimeField(default=timezone.now)
    origem = models.ImageField(upload_to='images', null=False, blank=True, verbose_name="Anexar PDF ou imagem :")
    ficha_tec = models.ImageField(upload_to='images', null=False, blank=True, verbose_name="Ficha Técnica :")
    especficacao_t = models.TextField(null=False, blank=True, verbose_name="Especificação Técnica")
    quantidade = models.PositiveIntegerField(default=1, null=False, blank=True)
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, related_name='Vidrarias_Sala')
    armario = models.ForeignKey(Armario, on_delete=models.SET_NULL, null=True, blank=True, related_name='Vidraria_Armario')
    bancada = models.ForeignKey(Bancada, on_delete=models.SET_NULL, null=True, blank=True, related_name='Vidraria_bancada')
    estante = models.ForeignKey(Estante, on_delete=models.SET_NULL, null=True, blank=True, related_name='Vidraria_prateleira') 
    prateleira = models.ForeignKey(Prateleira, on_delete=models.SET_NULL, null=True, blank=True, related_name='Vidraria_gaveta') 
    gaveta = models.ForeignKey(Gaveta, on_delete=models.SET_NULL, null=True, blank=True, related_name='Vidraria_Gaveta') 
    obs = models.TextField(verbose_name="Vidraria_Observação", blank=True)
    

    class Meta:
        verbose_name = u'Modelo'
        verbose_name_plural = u'Equipamentos'
        ordering = ['nome']

    def __str__(self):
         return self.nome

class Reagente(models.Model):
    DISPON_CHOICES = (
        ("SIM", "SIM"),
        ("NAO", "NÃO"),
    )
    nome = models.CharField(max_length=100, null=False, verbose_name="Nome :")
    formula_q = models.CharField(max_length=50, null=False, blank=True, verbose_name="Formula Química :")
    grau_p = models.FloatField(null=True, verbose_name="Grau_pureza :")
    unidade = models.ForeignKey(Unidade, on_delete=models.PROTECT, related_name='unidade')
    marca = models.ForeignKey(Marca, on_delete=models.PROTECT, related_name='reagente')
    quantidade = models.FloatField(null=True, verbose_name="Quantidade :")
    data_validade = models.DateTimeField(default=timezone.now, verbose_name="Validade")
    controle_pfex = models.CharField(max_length=50, null=True, blank=True, verbose_name="Controle PF / Exercito :")
    ficha_tec = models.ImageField(upload_to='images', null=True, blank=True, verbose_name="Anexar PDF ou imagem :")
    massamolecular = models.CharField(max_length=50, null=False, verbose_name="Massa Molecular :")
    densidade = models.CharField(max_length=50, null=False, verbose_name="Densidade :")
    disponibilidade = models.CharField(max_length=3, null=False, blank=True, choices=DISPON_CHOICES)   
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, related_name='Reagente_Sala')
    armario = models.ForeignKey(Armario, on_delete=models.SET_NULL, null=True, blank=True, related_name='Reagente_Armario')
    bancada = models.ForeignKey(Bancada, on_delete=models.SET_NULL, null=True, blank=True, related_name='Reagente_bancada')
    estante = models.ForeignKey(Estante, on_delete=models.SET_NULL, null=True, blank=True, related_name='Reagente_prateleira') 
    prateleira = models.ForeignKey(Prateleira, on_delete=models.SET_NULL, null=True, blank=True, related_name='Reagente_gaveta') 
    gaveta = models.ForeignKey(Gaveta, on_delete=models.SET_NULL, null=True, blank=True, related_name='Reagente_Gaveta')
    obs = models.TextField( blank=True, verbose_name="Reagente_Observação :") 
     
    
    def __str__(self):
        return self.nome    

class Diverso(models.Model):
    DISPON_CHOICES = (
        ("SIM", "SIM"),
        ("NAO", "NÃO"),
    )    
    nome = models.CharField(max_length=100, null=False, verbose_name="Nome :")
    marca = models.ForeignKey(Marca, on_delete=models.PROTECT, related_name='Diversos')
    unidade = models.ForeignKey(Unidade, on_delete=models.PROTECT, related_name='Diverso_unidade')
    quantidade = models.FloatField(null=True, verbose_name="Diverso_Quantidade :")
    origem = models.ImageField(upload_to='images', null=True, blank=True, verbose_name="Diversos_origem")    
    ficha_tec = models.ImageField(upload_to='images', null=True, blank=True, verbose_name="Diverso_Anexar_PDF_imagem :")    
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, related_name='Diverso_Sala')
    armario = models.ForeignKey(Armario, on_delete=models.SET_NULL, null=True, blank=True, related_name='Diverso_Armario')
    bancada = models.ForeignKey(Bancada, on_delete=models.SET_NULL, null=True, blank=True, related_name='Diverso_bancada')
    estante = models.ForeignKey(Estante, on_delete=models.SET_NULL, null=True, blank=True, related_name='Diverso_prateleira') 
    prateleira = models.ForeignKey(Prateleira, on_delete=models.SET_NULL, null=True, blank=True, related_name='Diverso_gaveta') 
    gaveta = models.ForeignKey(Gaveta, on_delete=models.SET_NULL, null=True, blank=True, related_name='Diverso_Gaveta')
    imagem = models.ImageField(upload_to='images', null=True, blank=True, verbose_name="Imagem_diverso :")   
    obs = models.TextField( blank=True, verbose_name="Diverso_Observação :")  
         
          
    
    def __str__(self):
        return self.nome

class PedidoSolucao(models.Model):     
    usuario = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="UsuarioPedidosolução :" )    
    nome = models.CharField(max_length=100, null=False, verbose_name="Nome :")
    concentracao =  models.FloatField(null=True, blank=True, verbose_name="Concetração :")
    data_producao = models.DateTimeField(default=timezone.now, verbose_name="Data_Produção_Solucão") 
    unidade = models.ForeignKey(Unidade, on_delete=models.PROTECT, related_name='Solução_unidade')  
    quantidade =models.PositiveIntegerField(default=1, null=True, verbose_name="Solução_Quantidade :")
    status = models.CharField(
        default="Em Preparação",
        max_length=15,
        choices=(
            ('Preparada', 'Preparada'),
            ('Em Produção', 'Em Produção'),            
        )
    )      
    sala = models.ForeignKey(Sala, on_delete=models.PROTECT, null=False, related_name='Solução_Sala')
    armario = models.ForeignKey(Armario, on_delete=models.SET_NULL, null=True, blank=True, related_name='Solução_Armario')
    bancada = models.ForeignKey(Bancada, on_delete=models.SET_NULL, null=True, blank=True, related_name='Solução_bancada')
    estante = models.ForeignKey(Estante, on_delete=models.SET_NULL, null=True, blank=True, related_name='Solução_prateleira') 
    prateleira = models.ForeignKey(Prateleira, on_delete=models.SET_NULL, null=True, blank=True, related_name='Solução_gaveta') 
    gaveta = models.ForeignKey(Gaveta, on_delete=models.SET_NULL, null=True, blank=True, related_name='Solução_Gaveta')
    obs = models.TextField( blank=True, verbose_name="Solução_Observação :") 
    estoque = models.PositiveIntegerField(null=True, blank=True, verbose_name="Solução_estoque :")
  
    
    def __str__(self):
        return self.id + ' - ' + self.nome   

class ItensPedidoSolucao(models.Model): 
    usuario = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="UsuarioItensPedidosolução :" )    
    pedidosolucao_id = models.IntegerField(null=True, blank=True)   
    reagente = models.ForeignKey(Reagente, on_delete=models.PROTECT, related_name='Reagente_Solução')  
    unidade = models.ForeignKey(Unidade, on_delete=models.PROTECT, related_name='Iten_solucao_unidade')  
    quantidade = models.PositiveIntegerField(null=True, blank=True)   
     
 
    def __str__(self):
        return self.pedidosolucao_id
