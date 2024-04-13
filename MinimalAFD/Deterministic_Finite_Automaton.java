
/*---------------------------------------------------------------------------------
[CRC(Class-responsibility-collaboration) CARD]:
|					Class (Deterministic_Finite_Automaton)							|
|	[Responsibility]						|	[Collaborator]						|



----------------------------------------------------------------------------------*/
//imports===================
import java.util.*;
//imports===================

public class Deterministic_Finite_Automaton {
	// Attributes________________________________________________________
	int cellsQuantity;
	List<DFACell> cellsOfDFA = new ArrayList<DFACell>();
	boolean isMinimumDFA;
	// Attributes________________________________________________________

	public void insertCell(int id, String name, boolean isBegin) {
		DFACell dfaCell = new DFACell(id, name, isBegin);
		cellsOfDFA.add(dfaCell);
	}

	// Sets and Gets_____________________________________________________
	public int getCellsQuantity() {
		return cellsQuantity;
	}

	public void setCellsQuantity(int cellsQuantity) {
		this.cellsQuantity = cellsQuantity;
	}

	public List<DFACell> getCellsOfDFA() {
		return cellsOfDFA;
	}

	public void setCellsOfDFA(List<DFACell> cellsOfDFA) {
		this.cellsOfDFA = cellsOfDFA;
	}

	public boolean isMinimumDFA() {
		return isMinimumDFA;
	}

	public void setMinimumDFA(boolean isMinimumDFA) {
		this.isMinimumDFA = isMinimumDFA;
	}
	// Sets and Gets_____________________________________________________

	public void printDFA() {
		System.out.println("\n=============[print DFA]============");
		for (DFACell dfaCell : cellsOfDFA) {
			dfaCell.printCell();
		}
		System.out.println("=============[end print]============\n");
	}

}
