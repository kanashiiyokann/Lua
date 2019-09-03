import entity.Function;

public interface StaticClass {
    /**
     *获取mod配置信息
     * @param key the key is the  name of configuration in mod configurations
     * @return  the option value player selected
     */
   Object GetModConfigData(String key);

    /**
     *在预制件完成初始化后执行
     * @param prefabName 预制件名称
     * @param fn 需要追加执行的方法
     */
    void AddPrefabPostInit(String prefabName, Function fn);
}
