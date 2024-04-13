
//imports===================
import java.io.File; // Import the File class
import java.io.FileNotFoundException; // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files
//imports===================

public class DFAReader {
	// Attributes________________________________________________________
	private String fileContent;
	Deterministic_Finite_Automaton DFA;
	// Attributes________________________________________________________

	// Personal methods__________________________________________________
	public DFAReader(String fileName) {
		setFileContent(toRead(fileName));
	}
	// Personal methods__________________________________________________

	// Set DFA___________________________________________________________
	public void setDFA(String fileContent) {

	}
	// Set DFA___________________________________________________________

	// File Reader_______________________________________________________
	public String toRead(String name) {
		createDFA();
		String data = name;
		String aux;
		int id;
		boolean isBegin = false;
		int[] path = new int[3]; // (from, to, read)

		int cellsQuantity = 0;

		try {
			File myObj = new File(data);
			Scanner myReader = new Scanner(myObj);
			while (myReader.hasNextLine()) {
				aux = myReader.nextLine();

				if (aux.contains("<state id")) {
					cellsQuantity++;
					// getting id================================================
					int idStart = aux.indexOf("id=\"") + "id=\"".length();
					int idEnd = aux.indexOf("\"", idStart);
					id = Integer.parseInt(aux.substring(idStart, idEnd));
					// ==========================================================

					// getting name==============================================
					int nameStart = aux.indexOf("name=\"") + "name=\"".length();
					int nameEnd = aux.indexOf("\"", nameStart);
					name = aux.substring(nameStart, nameEnd);
					// ==========================================================

					// setting is begin==========================================
					if (id == 0)
						isBegin = true;
					else {
						isBegin = false;
					}
					// setting is begin==========================================

					DFA.insertCell(id, name, isBegin);

				} // Cells

				if (aux.contains("<transition>")) {
					aux = myReader.nextLine();

					// getting from==============================================
					int fromStart = aux.indexOf("<from>") + "<from>".length();
					int fromEnd = aux.indexOf("</from>");
					int valueFrom = Integer.parseInt(aux.substring(fromStart, fromEnd));
					// getting from==============================================

					aux = myReader.nextLine();

					// getting to================================================
					int toStart = aux.indexOf("<to>") + "<to>".length();
					int toEnd = aux.indexOf("</to>");
					int valueTo = Integer.parseInt(aux.substring(toStart, toEnd));
					// getting to================================================

					aux = myReader.nextLine();

					// getting read==============================================
					int readStart = aux.indexOf("<read>") + "<read>".length();
					int readEnd = aux.indexOf("</read>");
					int valueRead = Integer.parseInt(aux.substring(readStart, readEnd));
					// getting read==============================================

					// setting path==============================================
					if (valueRead == 0) {
						DFA.cellsOfDFA.get(valueFrom).pathTo0 = valueTo;
					} else if (valueRead == 1) {
						DFA.cellsOfDFA.get(valueFrom).pathTo1 = valueTo;
					}
					// setting path==============================================

					path[0] = valueFrom;
					path[1] = valueTo;
					path[2] = valueRead;
				}

				data += aux + "\n";

				// System.out.println(data);
			}
			myReader.close();
		} catch (FileNotFoundException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		}
		System.out.println(cellsQuantity);
		DFA.printDFA();
		return data;
	}
	// File Reader_______________________________________________________

	// create DFA________________________________________________________
	private void createDFA() {
		DFA = new Deterministic_Finite_Automaton();
	}
	// create DFA________________________________________________________

	// Sets and Gets_____________________________________________________
	public String getFileContent() {
		return fileContent;
	}

	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}
	// Sets and Gets_____________________________________________________
}
