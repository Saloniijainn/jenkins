Here’s a step-by-step explanation of C1: Create a Maven project with all dependencies for CI/CD pipeline:

⸻

Objective:

To build a Maven-based Java project that uses external dependencies (like JSON) and can be integrated into a CI/CD pipeline using Jenkins.

⸻

Step-by-Step Process:

Step 1: Set Up Required Tools
	•	Install Eclipse IDE (or any Java IDE with Maven support).
	•	Ensure Java JDK is installed and configured.
	•	Make sure Maven is installed (or use the one embedded in Eclipse).

⸻

Step 2: Create Maven Project
	1.	Open Eclipse.
	2.	Go to: File → New → Project.
	3.	Choose Maven Project → Click Next.
	4.	Select Create a simple project (skip archetype selection) → Click Next.
	5.	Fill in:
	•	Group Id: e.g., com.vvce
	•	Artifact Id: e.g., JsonReader
	•	Click Finish.

⸻

Step 3: Create JSON Folder and File
	1.	Inside your Maven project, create a folder named JSON.
	2.	Create a .json file (e.g., data.json) and add sample JSON data like:

{
  "name": "Dummi",
  "age": 22
}



⸻

Step 4: Add JSON Dependency in pom.xml
	1.	Go to https://mvnrepository.com.
	2.	Search for simple-json.
	3.	Select a version (e.g., 1.1.1) and copy the dependency code:

<dependency>
    <groupId>com.googlecode.json-simple</groupId>
    <artifactId>json-simple</artifactId>
    <version>1.1.1</version>
</dependency>

	4.	Paste it inside <dependencies> in your pom.xml.

⸻

Step 5: Write Java Code to Read JSON
	1.	Inside src/main/java or src/test/java, create a class, e.g., ReadJson.java.
	2.	Sample code:

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.io.FileReader;

public class ReadJson {
    public static void main(String[] args) {
        try {
            JSONParser parser = new JSONParser();
            Object obj = parser.parse(new FileReader("JSON/data.json"));
            JSONObject jsonObject = (JSONObject) obj;

            String name = (String) jsonObject.get("name");
            long age = (long) jsonObject.get("age");

            System.out.println("Name: " + name);
            System.out.println("Age: " + age);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



⸻

Step 6: Build and Run
	•	Right-click the project → Run As → Java Application.
	•	Output should display the name and age from JSON.

⸻

Final Result:

You have a fully functional Maven project with dependencies, ready to be integrated into Jenkins CI/CD pipelines.

Would you like help integrating this into Jenkins (CI/CD)?


1️⃣ Create Maven Project

In Eclipse:

File → New → Other...

Search for Maven Project → Click Next

Choose Create a simple project → Next

archetype-quickstart

Group Id: com.samarth.jsonreader

Artifact Id: jsonproject

Name: jsonproject

Finish


✅ Eclipse creates:

jsonproject/
├── src/
│   ├── main/
│   │   └── java/
│   └── test/
│       └── java/
├── pom.xml


---

2️⃣ Add a JSON file

Right-click the project → New → Folder → Name it JSON

Inside the JSON folder, create a file like data.json


Example data.json:

{
  "name": "Samarth",
  "age": 22,
  "branch": "ISE"
}


---

3️⃣ Add JSON dependency in pom.xml

1. Go to https://mvnrepository.com


2. Search for json-simple


3. Choose a version (like 1.1.1)



Add this to pom.xml inside <dependencies>:

<dependency>
    <groupId>com.googlecode.json-simple</groupId>
    <artifactId>json-simple</artifactId>
    <version>1.1.1</version>
</dependency>

Then right-click your project → Maven → Update Project


---

4️⃣ Create Java class to read JSON

In src/test/java, create a class:
Right-click → New → Class → Name: JsonReader

Paste the following code:

import java.io.FileReader;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JsonReader {
    public static void main(String[] args) {
        try {
            JSONParser parser = new JSONParser();
            Object obj = parser.parse(new FileReader("JSON/data.json"));
            JSONObject jsonObject = (JSONObject) obj;

            System.out.println("Name: " + jsonObject.get("name"));
            System.out.println("Age: " + jsonObject.get("age"));
            System.out.println("Branch: " + jsonObject.get("branch"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


---

5️⃣ Run and Test

Right-click on JsonReader.java → Run As → Java Application
✅ You should see output:

Name: Samarth
Age: 22
Branch: ISE


---

🎯 Final Output

You now have a Maven project that:

Uses a dependency (from Maven Central)

Reads from a .json file

Can be pushed to GitHub and used in Jenkins for CI/CD



---

Do you want me to explain how to integrate this with Jenkins or Docker in your next DevOps step?
