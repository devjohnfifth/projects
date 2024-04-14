package FamousProblems.Two_Sum;

import java.util.HashMap;
import java.util.Map;

class TwoSumBestSolution {
    public static void main(String[] args) {
        int[] array = { 4, 17, 1, 9 };
        int target = 13;
        int[] solution = twoSum(target, array);
        printSolution(array, solution, target);

    }

    static int[] twoSum(int target, int[] array) {
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        int[] solution = new int[2];
        for (int i = 0; i < array.length; i++) {

            int complement = target - array[i];
            System.out.println("i : " + i + "   Array[i]: " + array[i] + "    Complement: " + complement
                    + "     Complement map " + map.get(complement));
            if (map.containsKey(complement)) {
                solution[0] = map.get(complement);
                solution[1] = i;
                break;
            }
            map.put(array[i], i);

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