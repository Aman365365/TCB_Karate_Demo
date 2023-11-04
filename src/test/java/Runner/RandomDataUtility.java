package Runner;

import net.datafaker.Faker;

public class RandomDataUtility {


    public static Faker faker = new Faker();



    public static String getRandomNumber(int count) {
        return faker.number().digits(count);
    }


    public static int getRandomNumber(int min, int max) {
        return faker.number().numberBetween(min, max);
    }

    public static String getRandomFirstName() {
        return faker.name().firstName();
    }

    public static String getRandomLastName() {
        return faker.name().lastName();
    }

    public static String getRandomFullName() {
        return faker.name().fullName();
    }

    public static String getRandomUserName() {
        return faker.name().username();
    }

    public static String getRandomCityName() {
        return faker.address().cityName();
    }

    public static String getRandomZipName() {
        return faker.address().zipCode();
    }

    public static String getRandomCountryName() {
        return faker.address().country();
    }

    public static String getRandomEmailName() {
        return faker.name().username() + "@gmail.com";
    }
}