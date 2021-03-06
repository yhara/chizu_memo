# coding:utf-8

# dependency:
#   jpmobile
#   rails(activesupport) for html_escape

# License: MIT
#
# Copyright (c) 2010 Yutaka HARA
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
module Jpmobile
  module PCEmoticon
    @emoticons_path = "/images/emoticons"
    def self.emoticons_path; @emoticons_path; end
    def self.emoticons_path=(v); @emoticons_path = v; end

    def translate_emoticons(str)
      html_escape(str).gsub(/[\uE468-\uF537]/){|c|
        case (v = CONVERSION_TABLE[c.unpack("U").first])
        when Symbol
          file = v.to_s.sub(/\A_/, "").gsub(/_/, "-")
          "<img src='#{Jpmobile::PCEmoticon.emoticons_path}/#{html_escape file}.gif'>"
        when String
          v
        else
          "[?]"
        end
      }.html_safe
    end

    if not defined?(::Encoding) # for Ruby 1.8
      def translate_emoticons(str)
        # [\uE468-\uF537]
        html_escape(str).chars.map{|c|
          if ("\xEE\x91\xA8".."\xEF\x94\xB7").include? c
            case (v = CONVERSION_TABLE[c.unpack("U").first])
            when Symbol
              file = v.to_s.sub(/\A_/, "").gsub(/_/, "-")
              "<img src='#{Jpmobile::PCEmoticon.emoticons_path}/#{html_escape file}.gif'>"
            when String
              v
            else
              "[?]"
            end
          else
            c
          end
        }.join.html_safe
      end
    end

    CONVERSION_TABLE = {
      0xE63E => :sun,
      0xE63F => :cloud,
      0xE640 => :rain,
      0xE641 => :snow,
      0xE642 => :thunder,
      0xE643 => :typhoon,
      0xE644 => :mist,
      0xE645 => :sprinkle,
      0xE646 => :aries,
      0xE647 => :taurus,
      0xE648 => :gemini,
      0xE649 => :cancer,
      0xE64A => :leo,
      0xE64B => :virgo,
      0xE64C => :libra,
      0xE64D => :scorpius,
      0xE64E => :sagittarius,
      0xE64F => :capricornus,
      0xE650 => :aquarius,
      0xE651 => :pisces,
      0xE652 => :sports,
      0xE653 => :baseball,
      0xE654 => :golf,
      0xE655 => :tennis,
      0xE656 => :soccer,
      0xE657 => :ski,
      0xE658 => :basketball,
      0xE659 => :motorsports,
      0xE65A => :pocketbell,
      0xE65B => :train,
      0xE65C => :subway,
      0xE65D => :bullettrain,
      0xE65E => :car,
      0xE65F => :rvcar,
      0xE660 => :bus,
      0xE661 => :ship,
      0xE662 => :airplane,
      0xE663 => :house,
      0xE664 => :building,
      0xE665 => :postoffice,
      0xE666 => :hospital,
      0xE667 => :bank,
      0xE668 => :atm,
      0xE669 => :hotel,
      0xE66A => :_24hours,
      0xE66B => :gasstation,
      0xE66C => :parking,
      0xE66D => :signaler,
      0xE66E => :toilet,
      0xE66F => :restaurant,
      0xE670 => :cafe,
      0xE671 => :bar,
      0xE672 => :beer,
      0xE673 => :fastfood,
      0xE674 => :boutique,
      0xE675 => :hairsalon,
      0xE676 => :karaoke,
      0xE677 => :movie,
      0xE678 => :upwardright,
      0xE679 => :carouselpony,
      0xE67A => :music,
      0xE67B => :art,
      0xE67C => :drama,
      0xE67D => :event,
      0xE67E => :ticket,
      0xE67F => :smoking,
      0xE680 => :nosmoking,
      0xE681 => :camera,
      0xE682 => :bag,
      0xE683 => :book,
      0xE684 => :ribbon,
      0xE685 => :present,
      0xE686 => :birthday,
      0xE687 => :telephone,
      0xE688 => :mobilephone,
      0xE689 => :memo,
      0xE68A => :tv,
      0xE68B => :game,
      0xE68C => :cd,
      0xE68D => :heart,
      0xE68E => :spade,
      0xE68F => :diamond,
      0xE690 => :club,
      0xE691 => :eye,
      0xE692 => :ear,
      0xE693 => :rock,
      0xE694 => :scissors,
      0xE695 => :paper,
      0xE696 => :downwardright,
      0xE697 => :upwardleft,
      0xE698 => :foot,
      0xE699 => :shoe,
      0xE69A => :eyeglass,
      0xE69B => :wheelchair,
      0xE69C => :newmoon,
      0xE69D => :moon1,
      0xE69E => :moon2,
      0xE69F => :moon3,
      0xE6A0 => :fullmoon,
      0xE6A1 => :dog,
      0xE6A2 => :cat,
      0xE6A3 => :yacht,
      0xE6A4 => :xmas,
      0xE6A5 => :downwardleft,
      0xE6CE => :phoneto,
      0xE6CF => :mailto,
      0xE6D0 => :faxto,
      0xE6D1 => :info01,
      0xE6D2 => :info02,
      0xE6D3 => :mail,
      0xE6D4 => :by_d,
      0xE6D5 => :d_point,
      0xE6D6 => :yen,
      0xE6D7 => :free,
      0xE6D8 => :id,
      0xE6D9 => :key,
      0xE6DA => :enter,
      0xE6DB => :clear,
      0xE6DC => :search,
      0xE6DD => :new,
      0xE6DE => :flag,
      0xE6DF => :freedial,
      0xE6E0 => :sharp,
      0xE6E1 => :mobaq,
      0xE6E2 => :one,
      0xE6E3 => :two,
      0xE6E4 => :three,
      0xE6E5 => :four,
      0xE6E6 => :five,
      0xE6E7 => :six,
      0xE6E8 => :seven,
      0xE6E9 => :eight,
      0xE6EA => :nine,
      0xE6EB => :zero,
      0xE70B => :ok,
      0xE6EC => :heart01,
      0xE6ED => :heart02,
      0xE6EE => :heart03,
      0xE6EF => :heart04,
      0xE6F0 => :happy01,
      0xE6F1 => :angry,
      0xE6F2 => :despair,
      0xE6F3 => :sad,
      0xE6F4 => :wobbly,
      0xE6F5 => :up,
      0xE6F6 => :note,
      0xE6F7 => :spa,
      0xE6F8 => :cute,
      0xE6F9 => :kissmark,
      0xE6FA => :shine,
      0xE6FB => :flair,
      0xE6FC => :annoy,
      0xE6FD => :punch,
      0xE6FE => :bomb,
      0xE6FF => :notes,
      0xE700 => :down,
      0xE701 => :sleepy,
      0xE702 => :sign01,
      0xE703 => :sign02,
      0xE704 => :sign03,
      0xE705 => :impact,
      0xE706 => :sweat01,
      0xE707 => :sweat02,
      0xE708 => :dash,
      0xE709 => :sign04,
      0xE70A => :sign05,
      0xE6AC => :slate,
      0xE6AD => :pouch,
      0xE6AE => :pen,
      0xE6B1 => :shadow,
      0xE6B2 => :chair,
      0xE6B3 => :night,
      0xE6B7 => :soon,
      0xE6B8 => :on,
      0xE6B9 => :end,
      0xE6BA => :clock,
      0xE70C => :appli01,
      0xE70D => :appli02,
      0xE70E => :t_shirt,
      0xE70F => :moneybag,
      0xE710 => :rouge,
      0xE711 => :denim,
      0xE712 => :snowboard,
      0xE713 => :bell,
      0xE714 => :door,
      0xE715 => :dollar,
      0xE716 => :pc,
      0xE717 => :loveletter,
      0xE718 => :wrench,
      0xE719 => :pencil,
      0xE71A => :crown,
      0xE71B => :ring,
      0xE71C => :sandclock,
      0xE71D => :bicycle,
      0xE71E => :japanesetea,
      0xE71F => :watch,
      0xE720 => :think,
      0xE721 => :confident,
      0xE722 => :coldsweats01,
      0xE723 => :coldsweats02,
      0xE724 => :pout,
      0xE725 => :gawk,
      0xE726 => :lovely,
      0xE727 => :good,
      0xE728 => :bleah,
      0xE729 => :wink,
      0xE72A => :happy02,
      0xE72B => :bearing,
      0xE72C => :catface,
      0xE72D => :crying,
      0xE72E => :weep,
      0xE72F => :ng,
      0xE730 => :clip,
      0xE731 => :copyright,
      0xE732 => :tm,
      0xE733 => :run,
      0xE734 => :secret,
      0xE735 => :recycle,
      0xE736 => :r_mark,
      0xE737 => :danger,
      0xE738 => :ban,
      0xE739 => :empty,
      0xE73A => :pass,
      0xE73B => :full,
      0xE73C => :leftright,
      0xE73D => :updown,
      0xE73E => :school,
      0xE73F => :wave,
      0xE740 => :fuji,
      0xE741 => :clover,
      0xE742 => :cherry,
      0xE743 => :tulip,
      0xE744 => :banana,
      0xE745 => :apple,
      0xE746 => :bud,
      0xE747 => :maple,
      0xE748 => :cherryblossom,
      0xE749 => :riceball,
      0xE74A => :cake,
      0xE74B => :bottle,
      0xE74C => :noodle,
      0xE74D => :bread,
      0xE74E => :snail,
      0xE74F => :chick,
      0xE750 => :penguin,
      0xE751 => :fish,
      0xE752 => :delicious,
      0xE753 => :smile,
      0xE754 => :horse,
      0xE755 => :pig,
      0xE756 => :wine,
      0xE757 => :shock,
      0xE481 => :danger,
      0xE482 => :sign01,
      0xE483 => "？",
      0xE52C => :mobaq,
      0xE52D => "<",
      0xE52E => ">",
      0xE52F => "<<",
      0xE530 => ">>",
      0xE531 => "■",
      0xE532 => "■",
      0xE533 => "[i]",
      0xE4C1 => :wine,
      0xE511 => "[スピーカ]",
      0xE579 => :dollar,
      0xE486 => :moon3,
      0xE487 => :thunder,
      0xE534 => "■",
      0xE535 => "■",
      0xE536 => "◆",
      0xE537 => "◆",
      0xE538 => "■",
      0xE539 => "■",
      0xE53A => :newmoon,
      0xE53B => :newmoon,
      0xE57A => :watch,
      0xE53C => "＋",
      0xE53D => "−",
      0xE53E => "＊",
      0xE53F => "↑",
      0xE540 => "↓",
      0xE541 => :ban,
      0xE542 => "▼",
      0xE543 => "▲",
      0xE544 => "▼",
      0xE545 => "▲",
      0xE546 => "◆",
      0xE547 => "◆",
      0xE548 => "■",
      0xE549 => "■",
      0xE54A => :newmoon,
      0xE54B => :newmoon,
      0xE54C => :upwardleft,
      0xE54D => :downwardright,
      0xE488 => :sun,
      0xE4BA => :baseball,
      0xE594 => :clock,
      0xE489 => :moon2,
      0xE512 => :bell,
      0xE560 => "φ",
      0xE4FA => :happy01,
      0xE595 => :heart01,
      0xE4C2 => :bar,
      0xE513 => :clover,
      0xE54E => :tm,
      0xE54F => "×",
      0xE561 => :memo,
      0xE57B => :sandclock,
      0xE47C => :sandclock,
      0xE562 => "[フロッピー]",
      0xE48A => "[雪結晶]",
      0xE550 => "×",
      0xE551 => "×",
      0xE552 => "→",
      0xE553 => "←",
      0xE4C3 => :beer,
      0xE554 => "÷",
      0xE563 => "[カレンダー]",
      0xE4FB => :happy01,
      0xE48B => "☆",
      0xE555 => :upwardright,
      0xE556 => :downwardleft,
      0xE514 => :ring,
      0xE557 => "[チェックマーク]",
      0xE4DF => :dog,
      0xE468 => "☆彡",
      0xE46C => :shine,
      0xE476 => :flair,
      0xE4E0 => :chick,
      0xE58F => "[フォルダ]",
      0xE4FC => :happy01,
      0xE558 => :copyright,
      0xE559 => :r_mark,
      0xE49C => :bag,
      0xE590 => "[フォルダ]",
      0xE596 => :telephone,
      0xE4FD => "[フキダシ]",
      0xE57C => "[カード]",
      0xE55A => "▲",
      0xE55B => "▼",
      0xE573 => "[USA]",
      0xE49D => :book,
      0xE564 => :memo,
      0xE597 => :cafe,
      0xE515 => :camera,
      0xE48C => :rain,
      0xE4BB => "[フットボール]",
      0xE565 => :book,
      0xE484 => :ng,
      0xE46A => :signaler,
      0xE566 => :book,
      0xE567 => :book,
      0xE568 => :book,
      0xE569 => :memo,
      0xE516 => :hairsalon,
      0xE56A => "[カレンダー]",
      0xE49E => :ticket,
      0xE48D => :cloud,
      0xE521 => :mail,
      0xE57D => :yen,
      0xE517 => :movie,
      0xE57E => :movie,
      0xE4AB => :house,
      0xE4E4 => :tulip,
      0xE57F => "[包丁]",
      0xE580 => "[ビデオ]",
      0xE4FE => :eyeglass,
      0xE55C => "└→",
      0xE55D => :enter,
      0xE518 => :search,
      0xE519 => :key,
      0xE56B => :book,
      0xE49F => :book,
      0xE581 => "[ネジ]",
      0xE51A => :boutique,
      0xE4B1 => :car,
      0xE582 => "[フロッピー]",
      0xE574 => "[グラフ]",
      0xE575 => "[グラフ]",
      0xE51B => :postoffice,
      0xE583 => :flair,
      0xE56C => :book,
      0xE55E => "[チェックマーク]",
      0xE4CE => :maple,
      0xE4E1 => :dog,
      0xE584 => "[電池]",
      0xE55F => :sign05,
      0xE56D => "[画びょう]",
      0xE51C => :key,
      0xE585 => :dollar,
      0xE4FF => "←",
      0xE500 => "→",
      0xE56E => :book,
      0xE4A0 => :clip,
      0xE4CF => :present,
      0xE51D => "[名札]",
      0xE4AC => :restaurant,
      0xE56F => :book,
      0xE4B2 => "[トラック]",
      0xE4A1 => :pencil,
      0xE586 => "[PDC]",
      0xE591 => :mailto,
      0xE587 => :wrench,
      0xE592 => "[送信BOX]",
      0xE593 => "[受信BOX]",
      0xE51E => :telephone,
      0xE4AD => :building,
      0xE570 => "[定規]",
      0xE4A2 => "[三角定規]",
      0xE576 => "[グラフ]",
      0xE4C4 => "[肉]",
      0xE588 => :mobilephone,
      0xE589 => "[コンセント]",
      0xE501 => "[家族]",
      0xE58A => "[リンク]",
      0xE51F => :present,
      0xE520 => :faxto,
      0xE48E => "&#xE63E;&#xE63F;",
      0xE4B3 => :airplane,
      0xE4B4 => :yacht,
      0xE4C8 => "[サイコロ]",
      0xE58B => "[新聞]",
      0xE4B5 => :train,
      0xE58C => "　",
      0xE47D => :smoking,
      0xE47E => :nosmoking,
      0xE47F => :wheelchair,
      0xE480 => "[若葉マーク]",
      0xE522 => :one,
      0xE523 => :two,
      0xE524 => :three,
      0xE525 => :four,
      0xE526 => :five,
      0xE527 => :six,
      0xE528 => :seven,
      0xE529 => :eight,
      0xE52A => :nine,
      0xE52B => "[10]",
      0xE469 => :typhoon,
      0xE485 => :snow,
      0xE48F => :aries,
      0xE490 => :taurus,
      0xE491 => :gemini,
      0xE492 => :cancer,
      0xE493 => :leo,
      0xE494 => :virgo,
      0xE495 => :libra,
      0xE496 => :scorpius,
      0xE497 => :sagittarius,
      0xE498 => :capricornus,
      0xE499 => :aquarius,
      0xE49A => :pisces,
      0xE49B => "[蛇使座]",
      0xE4A3 => :atm,
      0xE4A4 => :_24hours,
      0xE4A5 => :toilet,
      0xE4A6 => :parking,
      0xE4A7 => "[バス停]",
      0xE4A8 => "[アンテナ]",
      0xE4A9 => :ship,
      0xE4AA => :bank,
      0xE571 => :gasstation,
      0xE572 => "[地図]",
      0xE4AE => :bicycle,
      0xE4AF => :bus,
      0xE4B0 => :bullettrain,
      0xE46B => :run,
      0xE4B6 => :soccer,
      0xE4B7 => :tennis,
      0xE4B8 => :snowboard,
      0xE4B9 => :motorsports,
      0xE46D => "[観覧車]",
      0xE4BC => :spa,
      0xE4BD => :bottle,
      0xE4BE => :slate,
      0xE4BF => :night,
      0xE4C0 => "[東京タワー]",
      0xE46E => "[777]",
      0xE46F => "[オメデトウ]",
      0xE4C5 => "[的中]",
      0xE4C6 => :game,
      0xE4C7 => :dollar,
      0xE4C9 => :xmas,
      0xE4CA => :cherryblossom,
      0xE4CB => "[お化け]",
      0xE4CC => "[日の丸]",
      0xE4CD => "[スイカ]",
      0xE4D0 => :cake,
      0xE4D1 => "[フライパン]",
      0xE4D2 => :cherry,
      0xE4D3 => :fish,
      0xE4D4 => "[イチゴ]",
      0xE4D5 => :riceball,
      0xE4D6 => :fastfood,
      0xE470 => "[クジラ]",
      0xE4D7 => "[ウサギ]",
      0xE4D8 => :horse,
      0xE4D9 => "[サル]",
      0xE4DA => "[カエル]",
      0xE4DB => :cat,
      0xE4DC => :penguin,
      0xE4DD => "[アリ]",
      0xE4DE => :pig,
      0xE4E2 => "[ビーチ]",
      0xE4E3 => "[ひまわり]",
      0xE471 => :happy01,
      0xE472 => :angry,
      0xE473 => :crying,
      0xE474 => :bearing,
      0xE475 => :sleepy,
      0xE4E5 => :annoy,
      0xE4E6 => :sweat02,
      0xE4E7 => :bleah,
      0xE477 => :heart03,
      0xE478 => :heart04,
      0xE479 => :shine,
      0xE47A => :bomb,
      0xE47B => "[炎]",
      0xE4E8 => "[SOS]",
      0xE4E9 => "[力こぶ]",
      0xE4EA => :heart01,
      0xE4EB => :kissmark,
      0xE4EC => "[宇宙人]",
      0xE4ED => :typhoon,
      0xE4EE => :foot,
      0xE4EF => "[アクマ]",
      0xE4F0 => "[花丸]",
      0xE4F1 => :secret,
      0xE4F2 => "[100点]",
      0xE4F3 => :punch,
      0xE4F4 => :dash,
      0xE4F5 => "[ウンチ]",
      0xE4F6 => "[人差し指]",
      0xE4F7 => "[得]",
      0xE4F8 => "[ドクロ]",
      0xE4F9 => :good,
      0xE502 => :tv,
      0xE503 => :karaoke,
      0xE504 => :moneybag,
      0xE505 => :notes,
      0xE506 => "[ギター]",
      0xE507 => "[バイオリン]",
      0xE508 => :music,
      0xE509 => :rouge,
      0xE50A => "[ピストル]",
      0xE50B => "[エステ]",
      0xE577 => "[EZ]",
      0xE578 => :free,
      0xE50C => :cd,
      0xE50D => :t_shirt,
      0xE50E => "[UFO]",
      0xE50F => "[UP!]",
      0xE510 => "[注射]",
      0xE598 => :mist,
      0xE599 => :golf,
      0xE59A => :basketball,
      0xE59B => :pocketbell,
      0xE59C => :art,
      0xE59D => "[演劇]",
      0xE59E => :event,
      0xE59F => :ribbon,
      0xE5A0 => :birthday,
      0xE5A1 => :spade,
      0xE5A2 => :diamond,
      0xE5A3 => :club,
      0xE5A4 => :eye,
      0xE5A5 => :ear,
      0xE5A6 => :scissors,
      0xE5A7 => :paper,
      0xE5A8 => :newmoon,
      0xE5A9 => :moon1,
      0xE5AA => :moon2,
      0xE5AB => :clear,
      0xE5AC => :zero,
      0xE5AD => :ok,
      0xE5AE => :wobbly,
      0xE5AF => :heart02,
      0xE5B0 => :impact,
      0xE5B1 => :sweat01,
      0xE5B2 => "[ezplus]",
      0xE5B3 => "[地球]",
      0xE5B4 => :noodle,
      0xE5B5 => :new,
      0xE5B6 => :t_shirt,
      0xE5B7 => :shoe,
      0xE5B8 => :pc,
      0xE5B9 => "[ラジオ]",
      0xE5BA => "[バラ]",
      0xE5BB => "[教会]",
      0xE5BC => :subway,
      0xE5BD => :fuji,
      0xE5BE => :note,
      0xE5BF => "[天使]",
      0xE5C0 => "[トラ]",
      0xE5C1 => "[クマ]",
      0xE5C2 => "[ネズミ]",
      0xE5C3 => :wink,
      0xE5C4 => :lovely,
      0xE5C5 => :shock,
      0xE5C6 => :coldsweats02,
      0xE5C7 => "[タコ]",
      0xE5C8 => "[ロケット]",
      0xE5C9 => :crown,
      0xE5CA => :kissmark,
      0xE5CB => "[ハンマー]",
      0xE5CC => "[花火]",
      0xE5CD => :maple,
      0xE5CE => :bag,
      0xE5CF => "[噴水]",
      0xE5D0 => "[キャンプ]",
      0xE5D1 => "[麻雀]",
      0xE5D2 => "[VS]",
      0xE5D3 => "[トロフィー]",
      0xE5D4 => "[カメ]",
      0xE5D5 => "[スペイン]",
      0xE5D6 => "[ロシア]",
      0xE5D7 => "[工事中]",
      0xE5D8 => :spa,
      0xE5D9 => "[祝日]",
      0xE5DA => "[夕焼け]",
      0xE5DB => :chick,
      0xE5DC => "[株価]",
      0xE5DD => "[警官]",
      0xE5DE => :postoffice,
      0xE5DF => :hospital,
      0xEA80 => :school,
      0xEA81 => :hotel,
      0xEA82 => :ship,
      0xEA83 => "[18禁]",
      0xEA84 => "[バリ3]",
      0xEA85 => "[COOL]",
      0xEA86 => "[割]",
      0xEA87 => "[サービス]",
      0xEA88 => :id,
      0xEA89 => :full,
      0xEA8A => :empty,
      0xEA8B => "[指]",
      0xEA8C => "[営]",
      0xEA8D => "↑",
      0xEA8E => "↓",
      0xEA8F => "[占い]",
      0xEA90 => "[マナーモード]",
      0xEA91 => "[ケータイOFF]",
      0xEA92 => :memo,
      0xEA93 => "[ネクタイ]",
      0xEA94 => "[ハイビスカス]",
      0xEA95 => "[花束]",
      0xEA96 => "[サボテン]",
      0xEA97 => :bottle,
      0xEA98 => :beer,
      0xEA99 => "[祝]",
      0xEA9A => "[薬]",
      0xEA9B => "[風船]",
      0xEA9C => "[クラッカー]",
      0xEA9D => "[EZナビ]",
      0xEA9E => "[帽子]",
      0xEA9F => "[ブーツ]",
      0xEAA0 => "[マニキュア]",
      0xEAA1 => "[美容院]",
      0xEAA2 => "[床屋]",
      0xEAA3 => "[着物]",
      0xEAA4 => "[ビキニ]",
      0xEAA5 => :heart,
      0xEAA6 => :heart01,
      0xEAA7 => :heart01,
      0xEAA8 => :heart01,
      0xEAA9 => :heart01,
      0xEAAA => :heart01,
      0xEAAB => :shine,
      0xEAAC => :ski,
      0xEAAD => :fullmoon,
      0xEAAE => :japanesetea,
      0xEAAF => :bread,
      0xEAB0 => "[ソフトクリーム]",
      0xEAB1 => "[ポテト]",
      0xEAB2 => "[だんご]",
      0xEAB3 => "[せんべい]",
      0xEAB4 => :noodle,
      0xEAB5 => "[パスタ]",
      0xEAB6 => "[カレー]",
      0xEAB7 => "[おでん]",
      0xEAB8 => "[すし]",
      0xEAB9 => :apple,
      0xEABA => "[みかん]",
      0xEABB => "[トマト]",
      0xEABC => "[ナス]",
      0xEABD => "[弁当]",
      0xEABE => "[鍋]",
      0xEABF => :catface,
      0xEAC0 => :think,
      0xEAC1 => :smile,
      0xEAC2 => :bearing,
      0xEAC3 => :sad,
      0xEAC4 => :sleepy,
      0xEAC5 => :confident,
      0xEAC6 => :shock,
      0xEAC7 => "[風邪ひき]",
      0xEAC8 => "[熱]",
      0xEAC9 => :gawk,
      0xEACA => :wobbly,
      0xEACB => :coldsweats02,
      0xEACC => :notes,
      0xEACD => :happy01,
      0xEACE => "(>３<)",
      0xEACF => "(´３｀)",
      0xEAD0 => "[鼻]",
      0xEAD1 => :kissmark,
      0xEAD2 => "(>人<)",
      0xEAD3 => "[拍手]",
      0xEAD4 => :ok,
      0xEAD5 => :down,
      0xEAD6 => :paper,
      0xEAD7 => :ng,
      0xEAD8 => :ok,
      0xEAD9 => "m(_ _)m",
      0xEADA => :heart02,
      0xEADB => "[バニー]",
      0xEADC => "[トランペット]",
      0xEADD => "[ビリヤード]",
      0xEADE => "[水泳]",
      0xEADF => "[消防車]",
      0xEAE0 => "[救急車]",
      0xEAE1 => "[パトカー]",
      0xEAE2 => "[ジェットコースター]",
      0xEAE3 => "[門松]",
      0xEAE4 => "[ひな祭り]",
      0xEAE5 => "[卒業式]",
      0xEAE6 => "[ランドセル]",
      0xEAE7 => "[こいのぼり]",
      0xEAE8 => :sprinkle,
      0xEAE9 => "[花嫁]",
      0xEAEA => "[カキ氷]",
      0xEAEB => "[線香花火]",
      0xEAEC => "[巻貝]",
      0xEAED => "[風鈴]",
      0xEAEE => "[ハロウィン]",
      0xEAEF => "[お月見]",
      0xEAF0 => "[サンタ]",
      0xEAF1 => :night,
      0xEAF2 => "[虹]",
      0xEAF3 => "&#xE669;&#xE6EF;",
      0xEAF4 => :sun,
      0xEAF5 => :drama,
      0xEAF6 => "[デパート]",
      0xEAF7 => "[城]",
      0xEAF8 => "[城]",
      0xEAF9 => "[工場]",
      0xEAFA => "[フランス]",
      0xEAFB => "[オープンウェブ]",
      0xEAFC => "[カギ]",
      0xEAFD => "[ABCD]",
      0xEAFE => "[abcd]",
      0xEAFF => "[1234]",
      0xEB00 => "[記号]",
      0xEB01 => "[可]",
      0xEB02 => "[チェックマーク]",
      0xEB03 => :pen,
      0xEB04 => "[ラジオボタン]",
      0xEB05 => :search,
      0xEB06 => "[←BACK]",
      0xEB07 => "[ブックマーク]",
      0xEB08 => :phoneto,
      0xEB09 => :house,
      0xEB0A => :postoffice,
      0xEB0B => :memo,
      0xEB0C => :key,
      0xEB0D => :recycle,
      0xEB0E => "[ドイツ]",
      0xEB0F => "[イタリア]",
      0xEB10 => "[イギリス]",
      0xEB11 => "[中国]",
      0xEB12 => "[韓国]",
      0xEB13 => "[白人]",
      0xEB14 => "[中国人]",
      0xEB15 => "[インド人]",
      0xEB16 => "[おじいさん]",
      0xEB17 => "[おばあさん]",
      0xEB18 => "[赤ちゃん]",
      0xEB19 => "[工事現場の人]",
      0xEB1A => "[お姫様]",
      0xEB1B => "[イルカ]",
      0xEB1C => "[ダンス]",
      0xEB1D => :fish,
      0xEB1E => "[ゲジゲジ]",
      0xEB1F => "[ゾウ]",
      0xEB20 => "[コアラ]",
      0xEB21 => "[牛]",
      0xEB22 => "[ヘビ]",
      0xEB23 => "[ニワトリ]",
      0xEB24 => "[イノシシ]",
      0xEB25 => "[ラクダ]",
      0xEB26 => "[A]",
      0xEB27 => "[B]",
      0xEB28 => "[O]",
      0xEB29 => "[AB]",
      0xEB2A => :foot,
      0xEB2B => :shoe,
      0xEB2C => :flag,
      0xEB2D => :up,
      0xEB2E => :down,
      0xEB2F => :sign02,
      0xEB30 => :sign03,
      0xEB31 => :sign05,
      0xEB32 => "[メロン]",
      0xEB33 => "[パイナップル]",
      0xEB34 => "[ブドウ]",
      0xEB35 => :banana,
      0xEB36 => "[とうもろこし]",
      0xEB37 => "[キノコ]",
      0xEB38 => "[栗]",
      0xEB39 => "[モモ]",
      0xEB3A => "[やきいも]",
      0xEB3B => "[ピザ]",
      0xEB3C => "[チキン]",
      0xEB3D => "[七夕]",
      0xEB3E => :bar,
      0xEB3F => "[辰]",
      0xEB40 => "[ピアノ]",
      0xEB41 => :snowboard,
      0xEB42 => :fish,
      0xEB43 => "[ボーリング]",
      0xEB44 => "[なまはげ]",
      0xEB45 => "[天狗]",
      0xEB46 => "[パンダ]",
      0xEB47 => :bleah,
      0xEB48 => :pig,
      0xEB49 => "[花]",
      0xEB4A => "[アイスクリーム]",
      0xEB4B => "[ドーナツ]",
      0xEB4C => "[クッキー]",
      0xEB4D => "[チョコ]",
      0xEB4E => "[キャンディ]",
      0xEB4F => "[キャンディ]",
      0xEB50 => "(/_＼)",
      0xEB51 => "(・×・)",
      0xEB52 => "|(・×・)|",
      0xEB53 => "[火山]",
      0xEB54 => :heart01,
      0xEB55 => "[ABC]",
      0xEB56 => "[プリン]",
      0xEB57 => "[ミツバチ]",
      0xEB58 => "[てんとう虫]",
      0xEB59 => "[ハチミツ]",
      0xEB5A => :apple,
      0xEB5B => "[飛んでいくお金]",
      0xEB5C => "[クラクラ]",
      0xEB5D => :pout,
      0xEB5E => :pout,
      0xEB5F => :night,
      0xEB60 => "(´３｀)",
      0xEB61 => :happy01,
      0xEB62 => :mailto,
      0xEB63 => :happy02,
      0xEB64 => :happy02,
      0xEB65 => :lovely,
      0xEB66 => :sad,
      0xEB67 => :sad,
      0xEB68 => :weep,
      0xEB69 => :weep,
      0xEB6A => :smile,
      0xEB6B => "[ドレス]",
      0xEB6C => "[モアイ]",
      0xEB6D => "[駅]",
      0xEB6E => "[花札]",
      0xEB6F => "[ジョーカー]",
      0xEB70 => "[エビフライ]",
      0xEB71 => :mail,
      0xEB72 => :run,
      0xEB73 => "[パトカー]",
      0xEB74 => "[EZムービー]",
      0xEB75 => :heart02,
      0xEB76 => :chick,
      0xEB77 => :denim,
      0xEB78 => :loveletter,
      0xEB79 => :recycle,
      0xEB7A => :leftright,
      0xEB7B => :updown,
      0xEB7C => :wave,
      0xEB7D => :bud,
      0xEB7E => :snail,
      0xEB7F => :smile,
      0xEB80 => :smile,
      0xEB81 => "[Cメール]",
      0xEB82 => :clover,
      0xEB83 => :rock,
      0xEB84 => :sharp,
      0xEB85 => "(^-^)/",
      0xEB86 => "＼(^o^)／",
      0xEB87 => :sad,
      0xEB88 => :pout,
      0xF001 => :happy01,
      0xF002 => :happy01,
      0xF003 => :kissmark,
      0xF004 => :happy01,
      0xF005 => :happy01,
      0xF006 => :t_shirt,
      0xF007 => :shoe,
      0xF008 => :camera,
      0xF009 => :telephone,
      0xF00A => :mobilephone,
      0xF00B => :faxto,
      0xF00C => :pc,
      0xF00D => :punch,
      0xF00E => :good,
      0xF010 => :rock,
      0xF011 => :scissors,
      0xF012 => :paper,
      0xF013 => :ski,
      0xF014 => :golf,
      0xF015 => :tennis,
      0xF016 => :baseball,
      0xF017 => :snowboard,
      0xF018 => :soccer,
      0xF019 => :fish,
      0xF01A => :horse,
      0xF01B => :car,
      0xF01C => :yacht,
      0xF01D => :airplane,
      0xF01E => :train,
      0xF01F => :bullettrain,
      0xF020 => "[?]",
      0xF021 => :sign01,
      0xF022 => :heart01,
      0xF023 => :heart03,
      0xF024 => :clock,
      0xF025 => :clock,
      0xF026 => :clock,
      0xF027 => :clock,
      0xF028 => :clock,
      0xF029 => :clock,
      0xF02A => :clock,
      0xF02B => :clock,
      0xF02C => :clock,
      0xF02D => :clock,
      0xF02E => :clock,
      0xF02F => :clock,
      0xF030 => :cherryblossom,
      0xF031 => :crown,
      0xF033 => :xmas,
      0xF034 => :ring,
      0xF035 => :ring,
      0xF036 => :house,
      0xF038 => :building,
      0xF03A => :gasstation,
      0xF03B => :fuji,
      0xF03C => :karaoke,
      0xF03D => :movie,
      0xF03E => :note,
      0xF03F => :key,
      0xF043 => :restaurant,
      0xF044 => :bar,
      0xF045 => :cafe,
      0xF046 => :cake,
      0xF047 => :beer,
      0xF048 => :snow,
      0xF049 => :cloud,
      0xF04A => :sun,
      0xF04B => :rain,
      0xF04C => :moon3,
      0xF04D => :sun,
      0xF04F => :cat,
      0xF052 => :dog,
      0xF055 => :penguin,
      0xF056 => :happy01,
      0xF057 => :happy01,
      0xF058 => :despair,
      0xF059 => :angry,
      0xF101 => :postoffice,
      0xF102 => :postoffice,
      0xF103 => :mailto,
      0xF104 => :phoneto,
      0xF105 => :bleah,
      0xF106 => :lovely,
      0xF107 => :shock,
      0xF108 => :coldsweats02,
      0xF10B => :pig,
      0xF10E => :crown,
      0xF10F => :flair,
      0xF110 => :clover,
      0xF111 => :kissmark,
      0xF112 => :present,
      0xF114 => :search,
      0xF115 => :run,
      0xF118 => :maple,
      0xF11E => :bag,
      0xF11F => :chair,
      0xF120 => :fastfood,
      0xF123 => :spa,
      0xF125 => :ticket,
      0xF126 => :cd,
      0xF127 => :cd,
      0xF12A => :tv,
      0xF12E => "[VS]",
      0xF12F => :dollar,
      0xF132 => :motorsports,
      0xF133 => "[777]",
      0xF134 => :horse,
      0xF135 => :yacht,
      0xF136 => :bicycle,
      0xF138 => "[♂]",
      0xF139 => "[♀]",
      0xF13C => :sleepy,
      0xF13D => :thunder,
      0xF13E => :boutique,
      0xF13F => :spa,
      0xF140 => :toilet,
      0xF144 => :key,
      0xF145 => :key,
      0xF148 => :book,
      0xF149 => "[$\\]",
      0xF14D => :bank,
      0xF14E => :signaler,
      0xF14F => :parking,
      0xF151 => :toilet,
      0xF153 => :postoffice,
      0xF154 => :atm,
      0xF155 => :hospital,
      0xF156 => :_24hours,
      0xF157 => :school,
      0xF158 => :hotel,
      0xF159 => :bus,
      0xF15A => :car,
      0xF201 => :run,
      0xF202 => :ship,
      0xF203 => "[ココ]",
      0xF204 => :cute,
      0xF205 => :cute,
      0xF206 => :cute,
      0xF208 => :nosmoking,
      0xF20A => :wheelchair,
      0xF20C => :heart,
      0xF20D => :diamond,
      0xF20E => :spade,
      0xF20F => :club,
      0xF210 => :sharp,
      0xF211 => :freedial,
      0xF212 => :new,
      0xF213 => "[UP]",
      0xF214 => "[COOL]",
      0xF215 => "[有]",
      0xF216 => "[無]",
      0xF217 => "[月]",
      0xF218 => "[申]",
      0xF219 => :newmoon,
      0xF21A => :newmoon,
      0xF21B => :newmoon,
      0xF21C => :one,
      0xF21D => :two,
      0xF21E => :three,
      0xF21F => :four,
      0xF220 => :five,
      0xF221 => :six,
      0xF222 => :seven,
      0xF223 => :eight,
      0xF224 => :nine,
      0xF225 => :zero,
      0xF226 => "[得]",
      0xF227 => "[割]",
      0xF228 => "[サ]",
      0xF229 => :id,
      0xF22A => :full,
      0xF22B => :empty,
      0xF22C => "[指]",
      0xF22D => "[営]",
      0xF22E => "[↑]",
      0xF22F => "[↓]",
      0xF230 => "[←]",
      0xF231 => "[→]",
      0xF232 => "[↑]",
      0xF233 => "[↓]",
      0xF234 => "[→]",
      0xF235 => "[←]",
      0xF236 => :upwardright,
      0xF237 => :upwardleft,
      0xF238 => :downwardright,
      0xF239 => :downwardleft,
      0xF23A => "[>]",
      0xF23B => "[<]",
      0xF23C => "[>>]",
      0xF23D => "[<<]",
      0xF23F => :aries,
      0xF240 => :taurus,
      0xF241 => :gemini,
      0xF242 => :cancer,
      0xF243 => :leo,
      0xF244 => :virgo,
      0xF245 => :libra,
      0xF246 => :scorpius,
      0xF247 => :sagittarius,
      0xF248 => :capricornus,
      0xF249 => :aquarius,
      0xF24A => :pisces,
      0xF24C => "[TOP]",
      0xF24D => :ok,
      0xF24E => :copyright,
      0xF24F => :r_mark,
      0xF252 => :danger,
      0xF301 => :memo,
      0xF304 => :tulip,
      0xF309 => "[WC]",
      0xF30A => :music,
      0xF30B => :bottle,
      0xF30C => :beer,
      0xF30D => "[祝]",
      0xF30E => :smoking,
      0xF311 => :bomb,
      0xF313 => :hairsalon,
      0xF314 => :ribbon,
      0xF315 => :secret,
      0xF31A => :boutique,
      0xF31C => :rouge,
      0xF31F => :hairsalon,
      0xF323 => :bag,
      0xF324 => :slate,
      0xF325 => :bell,
      0xF326 => :notes,
      0xF327 => :heart01,
      0xF328 => :heart02,
      0xF329 => :heart01,
      0xF32A => :heart01,
      0xF32B => :heart01,
      0xF32C => :heart01,
      0xF32D => :heart01,
      0xF32E => :shine,
      0xF32F => "[☆]",
      0xF330 => :dash,
      0xF331 => :sweat01,
      0xF332 => :fullmoon,
      0xF333 => "[×]",
      0xF334 => :annoy,
      0xF335 => "[☆]",
      0xF336 => "[?]",
      0xF337 => :sign01,
      0xF338 => :japanesetea,
      0xF339 => :bread,
      0xF33E => :noodle,
      0xF340 => :noodle,
      0xF342 => :riceball,
      0xF345 => :apple,
      0xF34B => :birthday,
      0xF401 => :coldsweats02,
      0xF402 => :catface,
      0xF403 => :think,
      0xF404 => :smile,
      0xF405 => :wink,
      0xF406 => :bearing,
      0xF407 => :sad,
      0xF408 => :sleepy,
      0xF409 => :bleah,
      0xF40A => :confident,
      0xF40B => :shock,
      0xF40D => :happy02,
      0xF40E => :gawk,
      0xF40F => :coldsweats02,
      0xF410 => :wobbly,
      0xF411 => :crying,
      0xF412 => "&#xE6F0;&#xE72D;",
      0xF413 => :weep,
      0xF414 => :happy01,
      0xF415 => :happy01,
      0xF416 => :pout,
      0xF417 => :lovely,
      0xF418 => :lovely,
      0xF419 => :eye,
      0xF41B => :ear,
      0xF41C => :kissmark,
      0xF41E => :paper,
      0xF420 => :ok,
      0xF421 => :down,
      0xF422 => :paper,
      0xF423 => :ng,
      0xF424 => :ok,
      0xF425 => :heart02,
      0xF426 => "[m(_ _)m]",
      0xF427 => "[＼(^o^)／]",
      0xF42A => :basketball,
      0xF42E => :rvcar,
      0xF434 => :subway,
      0xF435 => :bullettrain,
      0xF43C => :sprinkle,
      0xF43E => :wave,
      0xF443 => :typhoon,
      0xF449 => :sun,
      0xF44A => :sun,
      0xF44B => :night,
      0xF501 => "&#xE669;&#xE6EF;",
      0xF502 => :art,
      0xF503 => :drama,
      0xF507 => :movie,
      0xF521 => :chick,
      0xF522 => :fish,
      0xF523 => :chick,
      0xF52A => :dog,
      0xF532 => "[A]",
      0xF533 => "[B]",
      0xF534 => "[AB]",
      0xF535 => "[O]",
      0xF536 => :foot,
      0xF537 => :tm,
    }

  end
end

if $0==__FILE__
  $KCODE = "u"
  class String; def html_safe; self; end; end
  def html_escape(str)
    str
  end
  include Jpmobile::PCEmoticon

  def u(n)
    [n].pack("U")
  end
  
  # tests
  before = "今日は#{u 0xE63E}なり#{u 0xF420}"
  expected = "今日は<img src='/images/emoticons/sun.gif'>なり<img src='/images/emoticons/ok.gif'>"
  given = translate_emoticons(before)
  raise given unless given == expected

  # map '_' to '-'
  before = "#{u 0xE736}Yutaka Hara"
  expected = "<img src='/images/emoticons/r-mark.gif'>Yutaka Hara"
  given = translate_emoticons(before)
  raise given unless given == expected

  # map the first '_' to ''
  before = "#{u 0xE4A4}営業"
  expected = "<img src='/images/emoticons/24hours.gif'>営業"
  given = translate_emoticons(before)
  raise given unless given == expected
  
  # do not map alphabets
  before = "ABcd"
  expected = "ABcd"
  given = translate_emoticons(before)
  raise given unless given == expected

  puts "test ok"
end
