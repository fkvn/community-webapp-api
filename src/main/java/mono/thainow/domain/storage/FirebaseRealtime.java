package mono.thainow.domain.storage;

import org.springframework.stereotype.Component;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class FirebaseRealtime {

	private DatabaseReference ref;

	public FirebaseRealtime() {

		// The app only has access to thainow-service-worker as defined in the Security
		// Rules
		this.ref = FirebaseDatabase.getInstance().getReference("/thainow-service-worker");

		ref.addListenerForSingleValueEvent(new ValueEventListener() {

			@Override
			public void onDataChange(DataSnapshot dataSnapshot) {
				String res = (String) dataSnapshot.getValue();
				System.out.println(res);
			}

			@Override
			public void onCancelled(DatabaseError error) {
				// TODO Auto-generated method stub

			}
		});
	}
}
