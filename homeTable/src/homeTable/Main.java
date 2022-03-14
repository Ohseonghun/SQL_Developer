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
		
		map.put("111", "3황 5제 시기의 로마에 대해 파해쳐보자\n");
		map.put("124", "중세의 성립과 그과정, 봉건정에 대한 새로운 시각!\n");
		map.put("186", "바다를 지배하는 자가 세계를 지배한다\n");
		map.put("210", "새로운 생물학적 관점으로 보는 인간\n");
		map.put("263", "우주의 처음부터 끝까지의 탐험\n");
		map.put("285", "아인슈타인 최대 업적\n");
		map.put("322", "사회 구성원들의 보이지 않는 밀접한 계약관계\n");
		map.put("356", "재미있게 보는 경재학\n");
		map.put("387", "사회 계급의 관계와 사회적 충돌에 초점을 둔 사회적 분석의 방법\n");

		
		ArrayList<BookList> BookList = new ArrayList<BookList>();

//		String scann = br.readLine();
//		String array[] = scann.split(" ");
//		StringTokenizer st = new StringTokenizer(scann);

		while (true) {
			bw.write("\n1.목록보기 2.대여&반납 3.전체 목록 보기 4.신규 책 등록 5.정보 수정 6.종료");
			bw.flush();
			int PickN = Integer.parseInt(br.readLine());

			if (PickN == 1) {
				bw.write("1.역사 2.과학 3.사회");
				bw.flush();
				int PickN1 = Integer.parseInt(br.readLine());
				if (PickN1 == 1) {
					bw.write("역사 서적입니다.\n1 책의 정보를 원하시면 코드를 입력하세요\n 111.로마의 유산 124.중세의 역사 186.대항해시대");
					bw.flush();
					String bookcode = br.readLine();
					bw.write(map.get(bookcode));
					bw.flush();
				} else if (PickN1 == 2) {
					bw.write("과학 서적입니다.\n 책의 정보를 원하시면 코드를 입력하세요\n 210.이기적 유전자 263. 코스모스 285.상대성이론");
					bw.flush();
					String bookcode = br.readLine();
					bw.write(map.get(bookcode));
					bw.flush();

				} else if (PickN1 == 3) {
					bw.write("사회 서적입니다. \n 책의 정보를 원하시면 코드를 입력하세요 \n 322.사회계약론 356.경재학콘서트 387.마르크스 사회주의");
					bw.flush();
					String bookcode = br.readLine();
					bw.write(map.get(bookcode));
					bw.flush();
				}
			}

			else if (PickN == 2) {
				bw.write("대여 할 책의 코드를 입력 해주세요\n");
				bw.flush();
				String bookcode = br.readLine();
				int i = 0;
				while (true) {
					bw.write("대여 하시겠습니까? Y/N \n");
					String YorN = br.readLine();
					bw.flush();

					if (i == 1) {
						bw.write("이미 대여 된 책입니다.\n");
						bw.flush();
						break;
					} else if (YorN.equals("y")) {
						bw.write("대여 완료 했습니다.\n");
						bw.flush();
						i++;

					} else if (YorN.equals("n")) {
						bw.write("대여 쉬소 했습니다.\n");
						bw.flush();
						break;
					}
				}

			} else if (PickN == 3) {
				while (true) {
					BookList book = new BookList();
					bw.write("보유 도서량:  " + BookList.size());
					for (int i = 0; i < BookList.size(); i++) {
						bw.write("===============================");
						bw.write("도서번호 : " + book.getCode());
						bw.write("도서제목 : " + book.getName());
						bw.write("장   르 : " + book.getGenre());
						bw.write("대여가능 : " + book.isRental());
						bw.write("===============================\n");
						bw.flush();

					} 
					bw.write("메뉴 이동 : [M] \t 프로그램 종료 : [0]");
					String temp = br.readLine();
					bw.flush();
					if (temp.equalsIgnoreCase("m")) {
						break;
					} else if (temp.equals("0")) {
						bw.write("프로그램을 종료합니다.");
					} else {
						bw.write("잘못 누르셨습니다. 초기화면으로 이동합니다.");
						break; 
					} 
				} 
			}
		
			else if (PickN == 4) {
				while (true) {
					BookList book = new BookList();
						int cnt = 0;
						bw.write("도서 번호 입력");
						bw.flush();
						
						String temp = br.readLine();
						for (int z = 0; z < BookList.size(); z++) {
							if (temp.equals(BookList.get(z).getName())) {
								cnt++;
								bw.write("도서 번호 중복입니다. 다시 입력하세요.");
								bw.flush();
								break;
							} 
						} 
						if (cnt == 0) {
							book.setName(temp);
							break;
						}
							bw.write("책 제목 입력");
							book.setName(br.readLine());
							bw.flush();
							
							bw.write("장르 입력");
							book.setGenre(br.readLine());
							bw.flush();
							
							book.setRental(true);

							
							bw.write("도서번호 : " + book.getCode());
							bw.flush();
							
							bw.write("도서제목 : " + book.getName());
							bw.flush();
							
							bw.write("장   르 : " + book.getGenre());
							bw.flush();
							
							bw.write("대여가능 : " + book.isRental());
							bw.flush();
							
							bw.write("입력하신 사항을 저장 하겠습니까? (Y/N)");
							bw.flush();
							
							String YorN1 = br.readLine();
							if (YorN1.equalsIgnoreCase("y")) {
								BookList.add(book);
								bw.write("입력 완료");
								bw.flush();
								
								break;
							} else if (YorN1.equalsIgnoreCase("n")) {
								bw.write("새로 입력하세요.");
								bw.flush();
								
							} else {
								bw.write("잘못 누르셨습니다. 초기 메뉴로 이동합니다");
								bw.flush();
								break; 

							}
					}
				}
			

			else if (PickN == 5) {
		        while (true) {
		        	bw.write("수정 할 책의 번호를 입력해주세요");
		        	bw.flush();
		            String scann2 = br.readLine();
		            int pics = 0;
		            for (int i = 0; i < BookList.size(); i++) {
		                if (scann2.equals(BookList.get(i).getName())) {
		                	bw.write("새로운 제목 입력: ");
		                    BookList.get(i).setName(br.readLine());
		                    bw.write("새로운 장르 입력: ");
		                    BookList.get(i).setGenre(br.readLine());
		                    pics++;
		                    bw.write("도서 수정 완료");
		                    break;
		                }
		            }
		            
		            if (pics == 0) {
		            	bw.write("해당 도서가 존재하지 않습니다. 도서 번호를 다시 입력하세요.");
		            	bw.flush();
		            } else {
		                break;
		            }
		        } 
		    }

			else if (PickN == 6) {
				bw.write("프로그램 종료");
				bw.flush();
				br.close();
			}

			else {
				bw.write("잘못 입력하셨습니다. 다시 입력하세요.");
				bw.flush();
				break;
			}

//			StartMenu Start = new StartMenu();
//			Start . ddd ();

		}
	}
}

