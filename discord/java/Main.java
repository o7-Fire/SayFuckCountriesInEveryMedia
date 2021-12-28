import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.util.*;

public class Main {
    //java 11
    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.out.println("Usage: java Main <token>");
            System.exit(1);
        }
        File countriesFile = new File("../../countries.txt");
        if (!countriesFile.exists()) {
            countriesFile = new File("countries.txt");
        }
        if (!countriesFile.exists()) {
            System.out.println("Could not find: " + countriesFile.getAbsolutePath());
        }
        List<String> countries = Files.readAllLines(countriesFile.toPath());
        String xSuperProperties = "{\"os\":\"Windows\",\"browser\":\"Discord Client\",\"release_channel\":\"ptb\",\"client_version\":\"1.0.1011\",\"os_version\":\"10.0.19042\",\"os_arch\":\"x64\",\"system_locale\":\"en-US\",\"client_build_number\":108924,\"client_event_source\":null}";
        xSuperProperties = Base64.getEncoder().encodeToString(xSuperProperties.getBytes());
        URL postURL = new URL("https://ptb.discord.com/api/v9/users/@me/settings");
        allowMethods("PATCH");
        Random random = new Random();
        while (true) {
            for (String country : countries) {
                try {
                    String message = "{\"custom_status\":{\"text\":\"Fuck " + country + "\"}}";
                    HttpURLConnection con = (HttpURLConnection) postURL.openConnection();

                    con.setRequestMethod("PATCH");
                    con.setRequestProperty("Content-Type", "application/json");
                    con.setRequestProperty("accept-language", "en-US,en;q=0.9");
                    con.setRequestProperty("Authorization", args[0]);
                    con.setRequestProperty("accept", "*/*");
                    con.setRequestProperty("Content-Length", Integer.toString(message.length()));
                    con.setRequestProperty("Content-Language", "en-US");
                    con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36");
                    con.setRequestProperty("X-Super-Properties", xSuperProperties);
                    con.setRequestProperty("x-discord-locale", "en-US");
                    con.setRequestProperty("x-debug-options", "bugReporterEnabled");
                    con.setDoOutput(true);
                    con.setDoInput(true);
                    con.getOutputStream().write(message.getBytes());
                    con.getOutputStream().flush();
                    String resp = new String(con.getInputStream().readAllBytes());
                    con.disconnect();
                    // System.out.println("Response: " + resp);
                    System.out.println("Fuck " + country);
                    Thread.sleep(random.nextInt(1000) + 2000);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //https://stackoverflow.com/questions/25163131/httpurlconnection-invalid-http-method-patch
    private static void allowMethods(String... methods) {
        try {
            Field methodsField = HttpURLConnection.class.getDeclaredField("methods");

            Field modifiersField = Field.class.getDeclaredField("modifiers");
            modifiersField.setAccessible(true);
            modifiersField.setInt(methodsField, methodsField.getModifiers() & ~Modifier.FINAL);

            methodsField.setAccessible(true);

            String[] oldMethods = (String[]) methodsField.get(null);
            Set<String> methodsSet = new LinkedHashSet<>(Arrays.asList(oldMethods));
            methodsSet.addAll(Arrays.asList(methods));
            String[] newMethods = methodsSet.toArray(new String[0]);

            methodsField.set(null/*static field*/, newMethods);
        } catch (NoSuchFieldException | IllegalAccessException e) {
            throw new IllegalStateException(e);
        }
    }
}
