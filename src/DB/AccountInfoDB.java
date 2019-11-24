package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import Functions.CheckConditions;

public class AccountInfoDB {
	public static int getAccountType(String id) {
		try {
			DBConnection.stmt = DBConnection.conn.createStatement();
			String sql = "select Account_type from Account where Id = '" + id + "'";
			ResultSet rs = DBConnection.stmt.executeQuery(sql);
			if (rs.next() && CheckConditions.isInteger(rs.getString(1))) {
				return Integer.parseInt(rs.getString(1));
			}
			return 0;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			return 0;
		}
	}
	
	public static boolean isEuqalPassword(String id, String password) {
		try {
			DBConnection.stmt = DBConnection.conn.createStatement();
			String sql = "select Password from Account where Id = '" + id + "'";
			ResultSet rs = DBConnection.stmt.executeQuery(sql);

			if (rs.next() && password.equals(rs.getString(1)))
				return true;
			return false;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			return false;
		}
	}

	public static boolean updatePassword(String id, String password) {
		try {
			DBConnection.stmt = DBConnection.conn.createStatement();
			String sql = "update Account set Password=" + password + " where Id=" + "'" + id + "'";
			DBConnection.stmt.executeQuery(sql);
			return true;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			return false;
		}
	}

	//TODO:
	//DB에서 삭제시 무결성 제약조건을 어김
	//그에대한 해결이 필요
	public static boolean WidthDrawal(String id) {
		try {
			DBConnection.stmt = DBConnection.conn.createStatement();
			String sql = "delete from Account where Id= '" + id + "'";
			DBConnection.stmt.executeQuery(sql);
			return true;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			return false;
		}
	}

	public static boolean updateAccountInfo(String id, String input[]) {
		try {
			DBConnection.stmt = DBConnection.conn.createStatement();

			final String[] attributes = { "Lname", "Fname", "Phone_no", "Birth_date", "Gender", "Email", "Address",
					"Occupation" };

			for (int i = 0; i < input.length; ++i) {
				if (!input[i].isEmpty()) {
					DBConnection.stmt.executeUpdate(
							"update account set " + attributes[i] + " = '" + input[i] + "' where Id = '" + id + "'");
				}
			}
			return true;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			return false;
		}
	}
}
