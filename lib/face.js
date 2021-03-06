var { chunk } = require('./util');

var emotionDataIndexs = {
  "[龇牙]": 0,
  "[调皮]": 1,
  "[流汗]": 2,
  "[偷笑]": 3,
  "[再见]": 4,
  "[敲打]": 5,
  "[擦汗]": 6,
  "[猪头]": 7,
  "[玫瑰]": 8,
  "[流泪]": 9,
  "[大哭]": 10,
  "[嘘]": 11,
  "[酷]": 12,
  "[抓狂]": 13,
  "[委屈]": 14,
  "[便便]": 15,
  "[炸弹]": 16,
  "[菜刀]": 17,
  "[可爱]": 18,
  "[色]": 19,

  "[害羞]": 20,
  "[得意]": 21,
  "[吐]": 22,
  "[微笑]": 23,
  "[怒]": 24,
  "[尴尬]": 25,
  "[惊恐]": 26,
  "[冷汗]": 27,
  "[爱心]": 28,
  "[示爱]": 29,
  "[白眼]": 30,
  "[傲慢]": 31,
  "[难过]": 32,
  "[惊讶]": 33,
  "[疑问]": 34,
  "[困1]": 35,
  "[么么哒]": 36,
  "[憨笑]": 37,
  "[爱情]": 38,
  "[衰]": 39,
  
  "[撇嘴]": 40,
  "[阴险]": 41,
  "[奋斗]": 42,
  "[发呆]": 43,
  "[右哼哼]": 44,
  "[抱抱]": 45,
  "[坏笑]": 46,
  "[飞吻]": 47,
  "[鄙视]": 48,
  "[晕]": 49,
  "[大兵]": 50,
  "[可怜]": 51,
  "[强]": 52,
  "[弱]": 53,
  "[握手]": 54,
  "[胜利]": 55,
  "[抱拳]": 56,
  "[凋谢]": 57,
  "[米饭]": 58,
  "[蛋糕]": 59,

  "[西瓜]": 60,
  "[啤酒]": 61,
  "[瓢虫]": 62,
  "[勾引]": 63,
  "[OK]": 64,
  "[爱你]": 65,
  "[咖啡]": 66,
  "[月亮]": 67,
  "[刀]": 68,
  "[发抖]": 69,
  "[差劲]": 70,
  "[拳头]": 71,
  "[心碎了]": 72,
  "[太阳]": 73,
  "[礼物]": 74,
  "[皮球]": 75,
  "[骷髅]": 76,
  "[挥手]": 77,
  "[闪电]": 78,
  "[饥饿]": 79,

  "[困]": 80,
  "[咒骂]": 81,
  "[折磨]": 82,
  "[抠鼻]": 83,
  "[鼓掌]": 84,
  "[糗大了]": 85,
  "[左哼哼]": 86,
  "[打哈欠]": 87,
  "[快哭了]": 88,
  "[吓]": 89,
  "[篮球]": 90,
  "[乒乓]": 91,
  "[NO]": 92,
  "[跳跳]": 93,
  "[怄火]": 94,
  "[转圈]": 95,
  "[磕头]": 96,
  "[回头]": 97,
  "[跳绳]": 98,
  "[激动]": 99,

  "[街舞]": 100,
  "[献吻]": 101,
  "[左太极]": 102,
  "[右太极]": 103,
  "[闭嘴]": 104,
  "[猫咪]": 105,
  "[红双喜]": 106,
  "[鞭炮]": 107,
  "[红灯笼]": 108,
  "[麻将]": 109,
  "[麦克风]": 110,
  "[礼品袋]": 111,
  "[信封]": 112,
  "[象棋]": 113,
  "[彩带]": 114,
  "[蜡烛]": 115,
  "[爆筋]": 116,
  "[棒棒糖]": 117,
  "[奶瓶]": 118,
  "[面条]": 119,

  "[香蕉]": 120,
  "[飞机]": 121,
  "[左车头]": 122,
  "[车厢]": 123,
  "[右车头]": 124,
  "[多云]": 125,
  "[下雨]": 126,
  "[钞票]": 127,
  "[熊猫]": 128,
  "[灯泡]": 129,
  "[风车]": 130,
  "[闹钟]": 131,
  "[雨伞]": 132,
  "[彩球]": 133,
  "[钻戒]": 134,
  "[沙发]": 135,
  "[纸巾]": 136,
  "[手枪]": 137,
  "[青蛙]": 138,
  // "[面条]": 139,
};

var emotions = {},
    emotionsArr = [];

for(var key in emotionDataIndexs) {
  let index = emotionDataIndexs[key];
  emotions[index] = [ key, `/img/emoticon/${ index }.png` ];
  emotionsArr[index] = [ key, `/img/emoticon/${ index }.png` ];
}

// var emotionsArr = Array.from({ ...emotions, length: 138 });
emotionsArr = chunk(emotionsArr, 20);

module.exports = {
  emotionDataIndexs,
  emotions,
  emotionsArr
}