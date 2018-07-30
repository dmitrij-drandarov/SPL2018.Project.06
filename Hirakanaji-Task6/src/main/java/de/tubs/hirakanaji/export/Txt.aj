package de.tubs.hirakanaji.export;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

import static de.tubs.hirakanaji.HirakanajiApplication.exportText;

public aspect Txt {

    after(): execution(void de.tubs.hirakanaji.HirakanajiApplication.main(String[])) {
        System.out.println("Your results will be exported into a text file. Enter file name.");
        String userInput = getUserInput();

        printOutput(userInput, exportText);
    }

    public static void printOutput(String fileName, String exportText) {
        Path path = Paths.get(fileName);
        byte[] strToBytes = exportText.getBytes();

        try {
            Files.write(path, strToBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String getUserInput() {
        Scanner scanner = new Scanner(System.in);
        return scanner.nextLine();
    }
}
