package FamousProblems.Two_Sum;

import java.util.Arrays;

class TwoSumMediumSolution {
    public static void main(String[] args) {
        int[] array = { 4, 17, 1, 9 };
        int target = 13;
        int[] solution = twoSum(target, array);
        printSolution(array, solution, target);
    }

    static int[] twoSum(int target, int[] array) {
        // First sort the array
        Arrays.sort(array);

        int[] solution = new int[2];
        int indexLeft;
        int indexRight = array.length - 1;
        for (indexLeft = 0; indexLeft < array.length - 1; indexLeft++) {
            System.out.println("IL : " + indexLeft + " IR : " + indexRight);
            if (array[indexLeft] + array[indexRight] == target) {
                solution[0] = indexLeft;
                solution[1] = indexRight;
                return solution;
            } else if (array[indexLeft] + array[indexRight] > target) {
                indexRight--;
            } else if (array[indexLeft] + array[indexRight] < target) {
                indexLeft++;
            }
        }
        return array;
    }

    static void printArray(int[] array) {
        System.out.print("Array : [");
        for (int i = 0; i < array.length; i++)
            System.out.print(array[i] + " ");
        System.out.println("]");
    }

    static void printSolution(int[] array, int[] solution, int target) {
        System.out.println("================================[Medium Solution]===============================");

        System.out.println("Target : " + target);
        printArray(array);
        System.out.println("The indexes of the solution is " + solution[0] + " and " + solution[1] + "\n");
        System.out.print(
                "This solution is O(NlogN)        :C\n================================================================================");
    }
}
