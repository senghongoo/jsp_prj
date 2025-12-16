package kr.co.sist.siteProperty;

public class SitePropertyVO {
	
	// VO(Value Object)는 DTO(Data Transfer Object)와 달리 데이터를 바꾸지 않고 저장하는 역할만 하므로 setter가 없다.
	// setter가 없으므로 인자 없는 생성자도 만들 필요가 없다.

	private String protocol, server_name, context_root, manage_path, key, title;

	public SitePropertyVO(String protocol, String server_name, String context_root, String manage_path, String key,
			String title) {
		super();
		this.protocol = protocol;
		this.server_name = server_name;
		this.context_root = context_root;
		this.manage_path = manage_path;
		this.key = key;
		this.title = title;
	}

	public String getProtocol() {
		return protocol;
	}

	public String getServer_name() {
		return server_name;
	}

	public String getContext_root() {
		return context_root;
	}

	public String getManage_path() {
		return manage_path;
	}

	public String getKey() {
		return key;
	}

	public String getTitle() {
		return title;
	}

	@Override
	public String toString() {
		return "SitePropertyVO [protocol=" + protocol + ", server_name=" + server_name + ", context_root="
				+ context_root + ", manage_path=" + manage_path + ", key=" + key + ", title=" + title + "]";
	}

}
