class ItensPedidoSolucao():
    def __init__(self, usuario, pedidosolucao_id, reagente, unidade, quantidade):
        self.__usuario = usuario
        self.__pedidosolucao_id = pedidosolucao_id
        self.__reagente = reagente        
        self.__unidade= unidade              
        self.__quantidade = quantidade         
        

    @property
    def usuario(self):
        return self.__usuario

    @usuario.setter
    def usuario(self, usuario):
        self.__usuario = usuario 
          
    @property
    def pedidosolucao_id(self):
        return self.__pedidosolucao_id

    @pedidosolucao_id.setter
    def pedidosolucao_id(self, pedidosolucao_id):
        self.__pedidosolucao_id = pedidosolucao_id    
    
    @property
    def reagente(self):
        return self.__reagente

    @reagente.setter
    def reagente(self, reagente):
        self.__reagente = reagente    

    @property
    def unidade(self):
        return self.__unidade

    @unidade.setter
    def unidade(self, unidade):
        self.__unidade = unidade   
        
    @property
    def quantidade(self):
        return self.__quantidade

    @quantidade.setter
    def quantidade(self, quantidade):
        self.__quantidade = quantidade   

    