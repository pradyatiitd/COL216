import java.util.*;

public class CompArc_Lab3 {

	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);

		int[][] arr = new int[8][8];
		// 0 means its black 1 means white and 2 means empty
		int turn_counter = 0;
		// 0 means black and 1 means white
		for (int i = 0; i < 8; i++) {
			for (int j = 0; j < 8; j++) {
				arr[i][j] = 2;
			}
		}
		arr[3][3] = 0;
		arr[4][4] = 0;
		arr[3][4] = 1;
		arr[4][3] = 1;
		while (true) {
			if (turn_counter == 0) {
				System.out.println("Black");
			} else {
				System.out.println("White");
			}
			int row = scn.nextInt();
			int col = scn.nextInt();
			turn_counter = game(arr, turn_counter, row, col);
			display(arr);
		}

	}

	public static int game(int[][] arr, int turn, int row, int col) {
		if (valid(arr, turn, row, col)) {
			return 1 - turn;
		} else {
			System.out.println("****Invalid Move; Please try again later****");
			return turn;
		}
	}

	public static boolean valid(int[][] arr, int turn, int row, int col) {
		if (row == 0 || row == 1) {
			if (col == 0 || col == 1) {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row + 1][col] == 1 - turn && arr[row + 2][col] == turn) {
						arr[row + 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col + 1] == 1 - turn && arr[row][col + 2] == turn) {
						arr[row][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col + 1] == 1 - turn && arr[row + 1][col + 1] == turn) {
						arr[row + 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			} else if (col == 7 || col == 6) {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row + 1][col] == 1 - turn && arr[row + 2][col] == turn) {
						arr[row + 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col - 1] == 1 - turn && arr[row][col - 2] == turn) {
						arr[row][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col - 1] == 1 - turn && arr[row + 1][col - 2] == turn) {
						arr[row + 1][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			} else {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row + 1][col] == 1 - turn && arr[row + 2][col] == turn) {
						arr[row + 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col - 1] == 1 - turn && arr[row][col - 2] == turn) {
						arr[row][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col - 1] == 1 - turn && arr[row + 1][col - 2] == turn) {
						arr[row + 1][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col + 1] == 1 - turn && arr[row][col + 2] == turn) {
						arr[row][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col + 1] == 1 - turn && arr[row + 1][col + 1] == turn) {
						arr[row + 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			}
		} else if (row == 7 || row == 6) {
			if (col == 0 || col == 1) {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row - 1][col] == 1 - turn && arr[row - 2][col] == turn) {
						arr[row - 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col + 1] == 1 - turn && arr[row][col + 2] == turn) {
						arr[row][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col + 1] == 1 - turn && arr[row - 2][col + 2] == turn) {
						arr[row - 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			} else if (col == 7 || col == 6) {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row - 1][col] == 1 - turn && arr[row - 2][col] == turn) {
						arr[row - 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col - 1] == 1 - turn && arr[row][col - 2] == turn) {
						arr[row][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col - 1] == 1 - turn && arr[row - 2][col - 2] == turn) {
						arr[row - 1][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			} else {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row - 1][col] == 1 - turn && arr[row - 2][col] == turn) {
						arr[row - 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col + 1] == 1 - turn && arr[row][col + 2] == turn) {
						arr[row][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col + 1] == 1 - turn && arr[row - 2][col + 2] == turn) {
						arr[row - 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col - 1] == 1 - turn && arr[row][col - 2] == turn) {
						arr[row][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col - 1] == 1 - turn && arr[row - 2][col - 2] == turn) {
						arr[row - 1][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			}
		} else {
			if (col == 0 || col == 1) {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row - 1][col] == 1 - turn && arr[row - 2][col] == turn) {
						arr[row - 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col + 1] == 1 - turn && arr[row][col + 2] == turn) {
						arr[row][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col + 1] == 1 - turn && arr[row - 2][col + 2] == turn) {
						arr[row - 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col] == 1 - turn && arr[row + 2][col] == turn) {
						arr[row + 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col + 1] == 1 - turn && arr[row + 2][col + 2] == turn) {
						arr[row + 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			} else if (col == 7 || col == 6) {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row - 1][col] == 1 - turn && arr[row - 2][col] == turn) {
						arr[row - 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col - 1] == 1 - turn && arr[row][col - 2] == turn) {
						arr[row][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col - 1] == 1 - turn && arr[row - 2][col - 2] == turn) {
						arr[row - 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col] == 1 - turn && arr[row + 2][col] == turn) {
						arr[row + 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col - 1] == 1 - turn && arr[row + 2][col - 2] == turn) {
						arr[row + 1][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			} else {
				if (arr[row][col] != 2) {
					return false;
				} else {
					if (arr[row - 1][col] == 1 - turn && arr[row - 2][col] == turn) {
						arr[row - 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col - 1] == 1 - turn && arr[row][col - 2] == turn) {
						arr[row][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col - 1] == 1 - turn && arr[row - 2][col - 2] == turn) {
						arr[row - 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col] == 1 - turn && arr[row + 2][col] == turn) {
						arr[row + 1][col] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col - 1] == 1 - turn && arr[row + 2][col - 2] == turn) {
						arr[row + 1][col - 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row - 1][col + 1] == 1 - turn && arr[row - 2][col + 2] == turn) {
						arr[row - 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row + 1][col + 1] == 1 - turn && arr[row + 2][col + 2] == turn) {
						arr[row + 1][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else if (arr[row][col + 1] == 1 - turn && arr[row][col + 2] == turn) {
						arr[row][col + 1] = turn;
						arr[row][col] = turn;
						return true;
					} else {
						return false;
					}
				}
			}
		}
	}

	public static void display(int[][] arr) {
		int n = arr.length;
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				System.out.print(arr[i][j]);
				System.out.print(" ");
			}
			System.out.println();
		}
	}

}
