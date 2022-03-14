package Library.menu;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;

//import Library.Data.BookValue;
import Library.Data.BookList;

public class Main {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		HashMap<String, String> map = new HashMap<>();
		
		map.put("111", "3Ȳ 5�� �ñ��� �θ��� ���� �����ĺ���\n");
		map.put("124", "�߼��� ������ �װ���, �������� ���� ���ο� �ð�!\n");
		map.put("186", "�ٴٸ� �����ϴ� �ڰ� ���踦 �����Ѵ�\n");
		map.put("210", "���ο� �������� �������� ���� �ΰ�\n");
		map.put("263", "������ ó������ �������� Ž��\n");
		map.put("285", "���ν�Ÿ�� �ִ� ����\n");
		map.put("322", "��ȸ ���������� ������ �ʴ� ������ ������\n");
		map.put("356", "����ְ� ���� ������\n");
		map.put("387", "��ȸ ����� ����� ��ȸ�� �浹�� ������ �� ��ȸ�� �м��� ���\n");

		
		ArrayList<BookList> BookList = new ArrayList<BookList>();

//		String scann = br.readLine();
//		String array[] = scann.split(" ");
//		StringTokenizer st = new StringTokenizer(scann);

		while (true) {
			bw.write("\n1.��Ϻ��� 2.�뿩&�ݳ� 3.��ü ��� ���� 4.�ű� å ��� 5.���� ���� 6.����");
			bw.flush();
			int PickN = Integer.parseInt(br.readLine());

			if (PickN == 1) {
				bw.write("1.���� 2.���� 3.��ȸ");
				bw.flush();
				int PickN1 = Integer.parseInt(br.readLine());
				if (PickN1 == 1) {
					bw.write("���� �����Դϴ�.\n1 å�� ������ ���Ͻø� �ڵ带 �Է��ϼ���\n 111.�θ��� ���� 124.�߼��� ���� 186.�����ؽô�");
					bw.flush();
					String bookcode = br.readLine();
					bw.write(map.get(bookcode));
					bw.flush();
				} else if (PickN1 == 2) {
					bw.write("���� �����Դϴ�.\n å�� ������ ���Ͻø� �ڵ带 �Է��ϼ���\n 210.�̱��� ������ 263. �ڽ��� 285.��뼺�̷�");
					bw.flush();
					String bookcode = br.readLine();
					bw.write(map.get(bookcode));
					bw.flush();

				} else if (PickN1 == 3) {
					bw.write("��ȸ �����Դϴ�. \n å�� ������ ���Ͻø� �ڵ带 �Է��ϼ��� \n 322.��ȸ���� 356.�������ܼ�Ʈ 387.����ũ�� ��ȸ����");
					bw.flush();
					String bookcode = br.readLine();
					bw.write(map.get(bookcode));
					bw.flush();
				}
			}

			else if (PickN == 2) {
				bw.write("�뿩 �� å�� �ڵ带 �Է� ���ּ���\n");
				bw.flush();
				String bookcode = br.readLine();
				int i = 0;
				while (true) {
					bw.write("�뿩 �Ͻðڽ��ϱ�? Y/N \n");
					String YorN = br.readLine();
					bw.flush();

					if (i == 1) {
						bw.write("�̹� �뿩 �� å�Դϴ�.\n");
						bw.flush();
						break;
					} else if (YorN.equals("y")) {
						bw.write("�뿩 �Ϸ� �߽��ϴ�.\n");
						bw.flush();
						i++;

					} else if (YorN.equals("n")) {
						bw.write("�뿩 ���� �߽��ϴ�.\n");
						bw.flush();
						break;
					}
				}

			} else if (PickN == 3) {
				while (true) {
					BookList book = new BookList();
					bw.write("���� ������:  " + BookList.size());
					for (int i = 0; i < BookList.size(); i++) {
						bw.write("===============================");
						bw.write("������ȣ : " + book.getCode());
						bw.write("�������� : " + book.getName());
						bw.write("��   �� : " + book.getGenre());
						bw.write("�뿩���� : " + book.isRental());
						bw.write("===============================\n");
						bw.flush();

					} 
					bw.write("�޴� �̵� : [M] \t ���α׷� ���� : [0]");
					String temp = br.readLine();
					bw.flush();
					if (temp.equalsIgnoreCase("m")) {
						break;
					} else if (temp.equals("0")) {
						bw.write("���α׷��� �����մϴ�.");
					} else {
						bw.write("�߸� �����̽��ϴ�. �ʱ�ȭ������ �̵��մϴ�.");
						break; 
					} 
				} 
			}
		
			else if (PickN == 4) {
				while (true) {
					BookList book = new BookList();
						int cnt = 0;
						bw.write("���� ��ȣ �Է�");
						bw.flush();
						
						String temp = br.readLine();
						for (int z = 0; z < BookList.size(); z++) {
							if (temp.equals(BookList.get(z).getName())) {
								cnt++;
								bw.write("���� ��ȣ �ߺ��Դϴ�. �ٽ� �Է��ϼ���.");
								bw.flush();
								break;
							} 
						} 
						if (cnt == 0) {
							book.setName(temp);
							break;
						}
							bw.write("å ���� �Է�");
							book.setName(br.readLine());
							bw.flush();
							
							bw.write("�帣 �Է�");
							book.setGenre(br.readLine());
							bw.flush();
							
							book.setRental(true);

							
							bw.write("������ȣ : " + book.getCode());
							bw.flush();
							
							bw.write("�������� : " + book.getName());
							bw.flush();
							
							bw.write("��   �� : " + book.getGenre());
							bw.flush();
							
							bw.write("�뿩���� : " + book.isRental());
							bw.flush();
							
							bw.write("�Է��Ͻ� ������ ���� �ϰڽ��ϱ�? (Y/N)");
							bw.flush();
							
							String YorN1 = br.readLine();
							if (YorN1.equalsIgnoreCase("y")) {
								BookList.add(book);
								bw.write("�Է� �Ϸ�");
								bw.flush();
								
								break;
							} else if (YorN1.equalsIgnoreCase("n")) {
								bw.write("���� �Է��ϼ���.");
								bw.flush();
								
							} else {
								bw.write("�߸� �����̽��ϴ�. �ʱ� �޴��� �̵��մϴ�");
								bw.flush();
								break; 

							}
					}
				}
			

			else if (PickN == 5) {
		        while (true) {
		        	bw.write("���� �� å�� ��ȣ�� �Է����ּ���");
		        	bw.flush();
		            String scann2 = br.readLine();
		            int pics = 0;
		            for (int i = 0; i < BookList.size(); i++) {
		                if (scann2.equals(BookList.get(i).getName())) {
		                	bw.write("���ο� ���� �Է�: ");
		                    BookList.get(i).setName(br.readLine());
		                    bw.write("���ο� �帣 �Է�: ");
		                    BookList.get(i).setGenre(br.readLine());
		                    pics++;
		                    bw.write("���� ���� �Ϸ�");
		                    break;
		                }
		            }
		            
		            if (pics == 0) {
		            	bw.write("�ش� ������ �������� �ʽ��ϴ�. ���� ��ȣ�� �ٽ� �Է��ϼ���.");
		            	bw.flush();
		            } else {
		                break;
		            }
		        } 
		    }

			else if (PickN == 6) {
				bw.write("���α׷� ����");
				bw.flush();
				br.close();
			}

			else {
				bw.write("�߸� �Է��ϼ̽��ϴ�. �ٽ� �Է��ϼ���.");
				bw.flush();
				break;
			}

//			StartMenu Start = new StartMenu();
//			Start . ddd ();

		}
	}
}

