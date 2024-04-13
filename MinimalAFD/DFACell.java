
//imports===================
import java.util.*;

//imports===================
public class DFACell {

	// Attributes________________________________________________________
	int id;
	String name;
	int pathTo0;// path to ID
	int pathTo1;// path to ID
	boolean isBegin;

	// int id;
	// String nome;
	// Deterministic_Finite_Automaton DFAMember;
	// DFACell pathTo0;
	// DFACell pathTo1;
	// List<DFACell> commingFromBy0 = new ArrayList<DFACell>();
	// List<DFACell> commingFromBy1 = new ArrayList<DFACell>();
	// boolean isBegin;
	// Attributes________________________________________________________

	public DFACell(int id, String name, boolean isBegin) {
		this.id = id;
		this.name = name;
		this.isBegin = isBegin;
	}

	public void printCell() {
		System.out.println("==========================================================");
		System.out.println("ID: " + id);
		System.out.println("Name: " + name);
		System.out.println("Is begin ?: " + isBegin);
		System.out.println("Path to 0: " + pathTo0);
		System.out.println("Path to 1: " + pathTo1);
		System.out.println("==========================================================");
	}
}
