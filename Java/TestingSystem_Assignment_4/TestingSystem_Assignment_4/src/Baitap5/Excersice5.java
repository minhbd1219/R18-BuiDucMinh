package Baitap5;
import java.util.ArrayList;
import java.util.Scanner;
import Baitap5.Employee;
import Baitap5.Engineer;
import Baitap5.Staff;
import Baitap5.Worker;


public class Excersice5 {
	private ArrayList<Staff> staffList;
	private Scanner sc;
	
	public Excersice5() {
	staffList = new ArrayList<Staff>();
	sc = new Scanner(System.in);
	}
	
	public void menu() {
		
	System.out.println("1.Them can bo: ");
	System.out.println("2.Tim kiem theo ho: ");
	System.out.println("3.Hien thi thong tin: ");
	System.out.println("4.Nhap vao ten va xoa can bo: ");
	System.out.println("5.Thoat chuong trinh ");


	int menuChoose = sc.nextInt();
	switch (menuChoose) {
	case 1:
		addStaff();
		break;
	case 2:
		findByName();
		break;
	case 3:
		printListStaff();
		break;
	case 4:
		deleteByName();
		break;
	case 5:
		return;
	default:
	System.out.println("Xin moi lua chon lai! ");
	break;
			}
	
	
	private void findByName() {
		System.out.println("Nhap ten muon tim: ");
		String findName = sc.next();
		for (Staff staff : staffList) {
		if (staff.getName().equals(findName)) {
		System.out.println(staff);
				}
			}
		}
	
	private void printListStaff() {
		for (Staff staff : staffList) {
		System.out.println(staff);
			}
		}

	private void deleteByName() {
		System.out.println("Nhap ten can xoa: ");
		String delName = sc.next();
		staffList.removeIf(staff -> staff.getName().equals(delName));
		printListStaff();

		}
	
	
	}
