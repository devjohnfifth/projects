package FamousProblems.Two_Sum;

public class TwoSumWorstSolution {
    public static void main(String[] args) {
        int[] array = { 4, 17, 1, 9 };
        int target = 13;
        int[] solution = twoSum(13, array);
        printSolution(array, solution, target);

    }

    static int[] twoSum(int target, int[] array) {
        int[] solution = new int[2];
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array.length; j++) {
                if (i != j && array[i] + array[j] == target) {
                    solution[0] = i;
                    solution[1] = j;
                }
            }
        }

        return solution;
    }

    static void printArray(int[] array) {
        System.out.print("Array : [");
        for (int i = 0; i < array.length; i++)
            System.out.print(array[i] + " ");
        System.out.println("]");
    }

    static void printSolution(int[] array, int[] solution, int target) {
        System.out.println("==================================[Worst Solution]==================================");

        System.out.println("Target : " + target);
        printArray(array);
        System.out.println("The indexes of the solution is " + solution[0] + " and " + solution[1] + "\n");
        System.out.print(
                "This solution is O(N^2)        :C\n====================================================================================");
    }
}
