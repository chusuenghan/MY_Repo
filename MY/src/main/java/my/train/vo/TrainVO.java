package my.train.vo;

public class TrainVO {
	private String stationId;
	private String stationName;
	
	public String getStationId() {
		return stationId;
	}
	public void setStationId(String stationId) {
		this.stationId = stationId;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	@Override
	public String toString() {
		return "TrainVO [stationId=" + stationId + ", stationName=" + stationName + "]";
	}
	
}
