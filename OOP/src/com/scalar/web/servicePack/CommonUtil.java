package com.scalar.web.servicePack;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;

public class CommonUtil {

	public static String generateTempIDs(ArrayList<String> arrayList) {

		String newID = null;

		if (arrayList.size() != 0) {

			String lastID = arrayList.get((arrayList.size()) - 1);
			char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
			String digit_sub = lastID.substring(3,5);
			String string_sub = lastID.substring(0, 3);
			String chara = lastID.substring(5);
			
			int digits = Integer.parseInt(digit_sub);

			digits++;

			

			if (digits == 100) {

				for (int i = 0; i < 26; i++) {
					if (alphabet[i] == lastID.charAt(5)) {
						chara = chara.replace(alphabet[i], alphabet[i + 1]);
					}
				}

				digits = 1;

				digit_sub = "0" + Integer.toString(digits);

				newID = string_sub + digit_sub + chara;
				arrayList.clear();
				return newID;
			} else if (digits < 10) {

				digit_sub = "0" + Integer.toString(digits);

				newID = string_sub + digit_sub + chara;
				arrayList.clear();
				return newID;

			} else {
				newID = string_sub + digits + chara;
				arrayList.clear();
				return newID;
			}
		} else {
			newID = "TMP01A";
			return newID;
		}

	}

	public static String generateIDs(ArrayList<String> arrayList) {

		String newID = null;

		if (arrayList.size() != 0) {

			char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
			Calendar cal = Calendar.getInstance();

			int year = cal.get(Calendar.YEAR);

			year = year % 100;

			String lastID = arrayList.get((arrayList.size()) - 1);

			String digit_sub = lastID.substring(4);
			String string_sub = lastID.substring(0, 2);

			int digits = Integer.parseInt(digit_sub);

			digits++;

			if (digits == 100) {

				for (int i = 0; i < 26; i++) {
					if (alphabet[i] == lastID.charAt(1)) {
						newID = string_sub.replace(alphabet[i], alphabet[i + 1]);
					}
				}

				digits = 1;

				digit_sub = "0" + Integer.toString(digits);

				newID = newID + year + digit_sub;
				arrayList.clear();
				return newID;
			} else if (digits < 10) {

				digit_sub = "0" + Integer.toString(digits);

				newID = string_sub + year + digit_sub;
				arrayList.clear();
				return newID;

			} else {
				newID = string_sub + year + digits;
				arrayList.clear();
				return newID;
			}

		} else {
			newID = "UA1801";
			return newID;
		}
	}

	public static String generateInquiryIDs(ArrayList<String> arrayList) {

		String newID = null;

		if (arrayList.size() != 0) {

			String lastID = arrayList.get((arrayList.size()) - 1);

			String digit_sub = lastID.substring(3);
			String string_sub = lastID.substring(0, 3);

			int digits = Integer.parseInt(digit_sub);

			digits++;

			newID = string_sub + digits;
			return newID;
		} else {
			newID = "INQ01";
			return newID;
		}
	}

	public static long generateTokens() {

		int max = 10000;
		int min = 1;

		Random rand = new Random();
		int value = rand.nextInt((max - min) + 1) + min;
		return value;

	}
}
