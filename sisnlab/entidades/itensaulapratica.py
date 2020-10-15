class ItensAulaPratica():
    def __init__(self, usuario, aulapratica_id, reagente, unidade, quant_reagente):
        self.__usuario = usuario
        self.__aulapratica_id = aulapratica_id        
        self.__reagente = reagente        
        self.__unidade= unidade              
        self.__quant_reagente = quant_reagente            

    @property
    def usuario(self):
        return self.__usuario

    @usuario.setter
    def usuario(self, usuario):
        self.__usuario = usuario 
          
    @property
    def aulapratica_id(self):
        return self.__aulapratica_id

    @aulapratica_id.setter
    def aulapratica_id(self, aulapratica_id):
        self.__aulapratica_id = aulapratica_id     
            
    
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
    def quant_reagente(self):
        return self.__quant_reagente

    @quant_reagente.setter
    def quant_reagente(self, quant_reagente):
        self.__quant_reagente = quant_reagente  