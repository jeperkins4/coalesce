class PollEvernote
  attr_accessor :identity

  def initialize(identity)
    self.identity = identity
  end

  def run
    note_store = EvernoteOAuth::Client.new(token: identity.accesstoken).note_store
    note_store.findNotes(Evernote::EDAM::NoteStore::NoteFilter.new, 0, 10).notes.each do |note|
      tags = note_store.listTagsByNotebook(note.notebook.guid)
      next if tags.empty?
      Project.where(hashtag: tags.map(&:name)).each do |project|
        message = Message.find_or_create_by(posted_text: note.title, nickname: note.attributes.author, provider: 'evernote', project_id: project.id)
        if identity.nickname == tweet.attributes.author
          message.identity_id = identity.id
          message.save if message.changed?
        end
      end
    end
  end
end
