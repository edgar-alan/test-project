public class AnimalLocator {

    public static String getAnimalNameById(Integer id){
        Http http =  new Http();
        HttpRequest request =  new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse  response = http.send(request);
        String animalName = '';
        if(response.getStatusCode() == 200){
            System.debug(response.getBody());
            Map<String, Animal> animalObject = (Map<String, Animal>) JSON.deserialize(response.getBody(), Map<String, Animal>.class);
            animalName = animalObject.get('animal').name;
        }
        
        return animalName;
    }


    class Animal{
        String name ;
    }    
    
}