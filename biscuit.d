/+

***************
Biscuit Ver.0.0
ポケットの中には自己復元能力のあるビスケットがひとつ．
※復元能力未実装につき今はただ割れていくだけです．

2015/11/7
cristappj
***************

+/

import
	std.stdio,
	std.datetime,
	std.random,
	std.array;

import
	core.time,
	core.thread;

void main() {
	int	all_counter = 0, // クラスにしような．ダサいから．マジで．
		counter_1 = 0,
		counter_2 = 0,
		counter_3 = 0,
		counter_4 = 0,
		counter_5 = 0,
		counter_6 = 0,
		counter_7 = 0,
		split_time = 2, // 分裂開始時間，単位:sec
		split_possibility = 4, // 分裂の起こりやすさ
		growth_time = 4; // 一段階の成長に要する時間，単位:sec

	int[] biscuit; // biscuitを格納する動的配列確保
	biscuit ~= 1; // 最初の1枚を格納
//	counter_1++;
	// = counter_1; // とりあえずカウンターを1上げる

	while (1) {
		Thread.sleep(dur!"seconds"(split_time));
		auto rand = Random(unpredictableSeed);
	//writeln(number = uniform(0, split_possibility, rand));
		int rand_number = uniform(0, split_possibility, rand);

		for(int i = 0; i < biscuit.length; i++){
			if(i%split_possibility == rand_number){ // 一の位がrand_numberと一致したbiscuitは割れる．
				if(biscuit[i] == 64){ // 1/64より小さくなったbiscuitは消滅する．
					for(int j=i; j < biscuit.length-1; j++){
						biscuit[j] = biscuit[j+1]; // 消滅した部分は前に詰める．
					}
					biscuit.popBack();
				}else{
					biscuit[i] = biscuit[i]*2; // まず自分が半分の大きさになる．
					biscuit ~= biscuit[i]; // 次に片割れを配列の最後尾にpushする．
				}
			}
		}

/*		for(int i = 0; i < biscuit.length; i++){
			if(biscuit[i] == 1){// do nothing. 
			}else{
				biscuit[i] = biscuit[i] >> 1;
			}
		} // 全biscuitを1段階成長させる．
*/

		for(int i = 0; i < biscuit.length; i++){
			counter_1 = counter_1 + biscuit[i]&1;
			counter_2 = counter_2 + ((biscuit[i]&2) >> 1);
			counter_3 = counter_3 + ((biscuit[i]&4) >> 2);
			counter_4 = counter_4 + ((biscuit[i]&8) >> 3);
			counter_5 = counter_5 + ((biscuit[i]&16) >> 4);
			counter_6 = counter_6 + ((biscuit[i]&32) >> 5);
			counter_7 = counter_7 + ((biscuit[i]&64) >> 6);
		} // biscuitの数を数える．

		all_counter = counter_1 + counter_2 + counter_3 + counter_4 + counter_5 + counter_6 + counter_7; // ダサい．なんとかする．
		writef("All🍪 : %d\nWhole🍪 : %d\n1/2🍪 : %d\n1/4🍪 : %d\n1/8🍪 : %d\n1/16🍪 : %d\n1/32🍪 : %d\n1/64🍪 : %d\n\n", 
			all_counter, counter_1, counter_2, counter_3, counter_4, counter_5, counter_6, counter_7); // 現在の枚数を表示	

		counter_1 = 0;
		counter_2 = 0;
		counter_3 = 0;
		counter_4 = 0;
		counter_5 = 0;
		counter_6 = 0;
		counter_7 = 0;
		all_counter = 0;

		writeln(biscuit);
//		writeln(biscuit.length);

		if(biscuit.length == 0) {
			break;
		}

	}
}
