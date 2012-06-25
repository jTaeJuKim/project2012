require 'spec_helper'

describe "Song pages" do

  subject { page }

  describe "a song page" do
    let(:song) { FactoryGirl.create(:song) }
    before { visit song_path(song) }

    it { should have_selector('h3',    text: song.title) }
    it { should have_selector('h3', text: song.artist) }
    it { should have_selector('h3', text: 'Lyrics')}
    it { should have_selector('pre', text: song.lyrics) }
  end

  describe "adding a song to the library" do

    before { visit new_song_path }

    let(:submit){ "Save song" }

    describe "with blanks in the form" do
      it "should not create a song" do
        expect{ click_button submit }.not_to change(Song, :count)
      end
    end

    describe "with a valid song" do
      before do
        fill_in "Title", with: "Example Song"
        fill_in "Artist", with: "Example Artist"
        fill_in "Lyrics", with: "Example Lyrics lalalalallalalala"
      end

      it "should create a song" do
        expect{ click_button submit}.to change(Song, :count).by(1)
      end
    end
  end


  describe "edit song" do

    let(:song){ FactoryGirl.create(:song) }

    before { visit edit_song_path(song) }

    describe "page" do
      it { should have_selector('h3',    text: "Edit song") }
      it { should have_selector('title', text: "Edit song") }
    end

    describe "with invalid information" do
      before do 
        fill_in "Title", with: "" 
        click_button "Save changes"
      end

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_title) {"New Title"}
      let(:new_artist) {"New Artist"}
      let(:new_lyrics) {"New Lyrics"}
      before do
       fill_in "Title", with: new_title
       fill_in "Artist", with: new_artist
       fill_in "Lyrics", with: new_lyrics
       click_button "Save changes"
     end
      it{ should have_selector('div.alert.alert-success') }
    end
  end


end