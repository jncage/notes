package notes.service;

import notes.dao.NoteRepository;
import notes.model.Note;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class NoteService {
    private final NoteRepository noteRepository;

    public NoteService(NoteRepository noteRepository) {
        this.noteRepository = noteRepository;
    }

    public List<Note> findAll() {
        List<Note> notes = new ArrayList<>();
        for (Note note : noteRepository.findAll()) {
            notes.add(note);
        }
        return notes;
    }

    public void save(Note note) {
        noteRepository.save(note);
    }
    public Note findOne(int id){
        return noteRepository.findOne(id);
    }

    public void delete(int id) {
        noteRepository.delete(id);
    }

}
