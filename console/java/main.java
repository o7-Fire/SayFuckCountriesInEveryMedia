import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.util.*;

public class Main {
    //kys
    public static void main(String[] args) throws IOException {
        File countriesFile = new File("../../countries.txt");
        if (!countriesFile.exists()) {
            countriesFile = new File("countries.txt");
        }
        if (!countriesFile.exists()) {
            System.out.println("Could not find: " + countriesFile.getAbsolutePath() + " Downloading...");
            try{
            Files.copy(new URL("https://raw.githubusercontent.com/o7-Fire/SayFuckCountriesInEveryApp/main/countries.txt").openStream(), countriesFile.toPath());
            System.out.println("Done Downloading: " + countriesFile.getAbsolutePath() + " Exiting...");
            System.exit(0);
            }catch(Exception e){
                System.out.println("Failed to download: " + countriesFile.getAbsolutePath() + " Exiting...");
                e.printStackTrace();
                System.exit(0);
            }
        }
        List<String> countries = Files.readAllLines(countriesFile.toPath());
        Random random = new Random();
        while (true) {
            for (String country : countries) {
                try {
                    System.out.println("Fuck " + country);
                    Thread.sleep(random.nextInt(1000) + 2000);
                } catch (Exception e) {
                    e.printStackTrace();
                }
             }
        }
    }
}   