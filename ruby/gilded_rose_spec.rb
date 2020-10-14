require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    subject { GildedRose.new(items).update_quality() }
    let(:items) { [Item.new(name, sell_in, quality)] }
    let(:name) { 'foo' }
    let(:sell_in) { 0 }
    let(:quality) { 0 }

    context 'normal item' do
      it "does not change the name" do
        subject
        expect(items[0].name).to eq "foo"
      end
      it "updates sell_in" do
        subject
        expect(items[0].sell_in).to eq(-1)
      end
      it "updates quality" do
        subject
        expect(items[0].quality).to eq(0)
      end

      context 'after sell by date' do
        let(:quality) { 10 }

        it "updates quality" do
          subject
          expect(items[0].quality).to eq(8)
        end
      end

      context 'barely quality left' do
        let(:quality) { 1 }

        it 'updates quality' do
          subject
          expect(items[0].quality).to eq(0)
        end
      end

      context 'before sell by date' do
        let(:quality) { 10 }
        let(:sell_in) { 5 }

        it "updates sell_in" do
          subject
          expect(items[0].sell_in).to eq(4)
        end
        it "updates quality" do
          subject
          expect(items[0].quality).to eq(9)
        end
      end
    end

    context 'brie' do
      let(:name) { "Aged Brie" }

      it "does not change the name" do
        subject
        expect(items[0].name).to eq "Aged Brie"
      end
      it "updates sell_in" do
        subject
        expect(items[0].sell_in).to eq(-1)
      end
      it "updates quality" do
        subject
        expect(items[0].quality).to eq(2)
      end

      context 'before sell by date' do
        let(:sell_in) { 2 }
        let(:quality) { 10 }

        it "updates sell_in" do
          subject
          expect(items[0].sell_in).to eq(1)
        end
        it "updates quality" do
          subject
          expect(items[0].quality).to eq(11)
        end
      end

      context 'fully aged' do
        let(:quality) { 50 }

        it "updates quality" do
          subject
          expect(items[0].quality).to eq(50)
        end
      end
    end

    context 'backstage pass' do
      let(:name) { "Backstage passes to a TAFKAL80ETC concert" }

      it "does not change the name" do
        subject
        expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      end
      it "updates sell_in" do
        subject
        expect(items[0].sell_in).to eq(-1)
      end
      it "updates quality" do
        subject
        expect(items[0].quality).to eq(0)
      end

      context 'far before sell by date' do
        let(:sell_in) { 11 }
        let(:quality) { 10 }

        it "updates sell_in" do
          subject
          expect(items[0].sell_in).to eq(10)
        end
        it "updates quality" do
          subject
          expect(items[0].quality).to eq(11)
        end
      end

      context 'close before sell by date' do
        let(:sell_in) { 6 }
        let(:quality) { 10 }

        it "updates sell_in" do
          subject
          expect(items[0].sell_in).to eq(5)
        end
        it "updates quality" do
          subject
          expect(items[0].quality).to eq(12)
        end
      end

      context 'right before sell by date' do
        let(:sell_in) { 2 }
        let(:quality) { 10 }

        it "updates sell_in" do
          subject
          expect(items[0].sell_in).to eq(1)
        end
        it "updates quality" do
          subject
          expect(items[0].quality).to eq(13)
        end
      end

      context 'at full quality' do
        let(:quality) { 50 }
        let(:sell_in) { 5 }

        it "updates quality" do
          subject
          expect(items[0].quality).to eq(50)
        end
      end

      context 'at expiration' do
        let(:quality) { 50 }

        it "updates quality" do
          subject
          expect(items[0].quality).to eq(0)
        end
      end
    end

    context 'sulfuras' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }

      it "does not change the name" do
        subject
        expect(items[0].name).to eq name
      end
      it "updates sell_in" do
        subject
        expect(items[0].sell_in).to eq(0)
      end
      it "updates quality" do
        subject
        expect(items[0].quality).to eq(0)
      end

      context 'after sell by date' do
        let(:quality) { 10 }

        it "updates quality" do
          subject
          expect(items[0].quality).to eq(10)
        end
      end

      context 'before sell by date' do
        let(:quality) { 10 }
        let(:sell_in) { 5 }

        it "updates sell_in" do
          subject
          expect(items[0].sell_in).to eq(5)
        end
        it "updates quality" do
          subject
          expect(items[0].quality).to eq(10)
        end
      end
    end

    xcontext 'conjured' do
      let(:name) { "Conjured Mana Cake" }

      it "does not change the name" do
        subject
        expect(items[0].name).to eq name
      end
      it "updates sell_in" do
        subject
        expect(items[0].sell_in).to eq(-1)
      end
      it "updates quality" do
        subject
        expect(items[0].quality).to eq(0)
      end

      context 'after sell by date' do
        let(:quality) { 10 }

        it "updates quality" do
          subject
          expect(items[0].quality).to eq(6)
        end
      end

      context 'minimum quality left' do
        let(:quality) { 3 }

        it "updates quality" do
          subject
          expect(items[0].quality).to eq(0)
        end
      end

      context 'before sell by date' do
        let(:sell_in) { 2 }
        let(:quality) { 10 }

        it "updates sell_in" do
          subject
          expect(items[0].sell_in).to eq(1)
        end
        it "updates quality" do
          subject
          expect(items[0].quality).to eq(8)
        end

        context 'minimum quality left' do
          let(:quality) { 1 }

          it "updates quality" do
            subject
            expect(items[0].quality).to eq(0)
          end
        end
      end
    end
  end
end
