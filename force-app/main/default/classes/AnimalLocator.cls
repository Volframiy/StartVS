public class AnimalLocator {
    
    public class Animal {
            public Integer id;
            public String name;
            public String eats;
            public String says;
    }
    
    public class ResAnimal{
        public Animal animal;
    }


    public static String getAnimalNameById(Integer idVar){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + idVar);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        ResAnimal results = (ResAnimal)JSON.deserialize(response.getBody(), ResAnimal.class);
        
        return results.animal.name;
    }
}