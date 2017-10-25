package notes.dao;

import notes.model.Note;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface NoteRepository extends CrudRepository<Note, Integer> {


}
