class Marca():
    def __init__(self, nome, obs):
        self.__nome = nome              
        self.__obs = obs

    @property
    def nome(self):
        return self.__nome

    @nome.setter
    def nome(self, nome):
        self.__nome = nome     
    
    @property
    def obs(self):
        return self.__obs

    @obs.setter
    def obs(self, obs):
        self.__obs = obs

